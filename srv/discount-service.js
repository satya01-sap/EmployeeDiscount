const cds = require('@sap/cds');
const LOG = cds.log('SFSF');
const { XMLParser } = require('fast-xml-parser');

const { Employees } = cds.entities;

module.exports = cds.service.impl(async function () {
    //const sfsfDestination = await cds.connect.to('SuccessFactors');

    /**
     * @Before(event = "READ", entity = "Employees")
     */
    this.before('READ', 'Employees', async (req) => {
      LOG.info('Start SFSF SOAP Call...........');

      const companyId = process.env.SFSF_COMPANY_ID || 'SFPXXXXXXX';
      const username = process.env.SFSF_USERNAME || 'myusername';
      const password = process.env.SFSF_PASSWORD || 'mypassword';

      const sf = await cds.connect.to('SuccessFactors')

      const sessionId = await getSFSessionId(sf, username, password, companyId)

      const rawXml = await queryCompoundEmployee(sf, sessionId)

      const employees = parseCompoundEmployeeResponse(rawXml)

      LOG.info('Employees from SFSF:', employees)


    });

    // Step 1: Login to SFSF and get Session ID
    async function getSFSessionId(sf, username, password, companyId) {
      const loginPayload = `
                <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:sfobject.sfapi.successfactors.com">
                <soapenv:Header/>
                <soapenv:Body>
                    <urn:login>
                      <urn:credential>
                          <urn:companyId>${companyId}</urn:companyId>
                          <urn:username>${username}</urn:username>
                          <urn:password>${password}</urn:password>
                          <!--Optional:-->
                          <urn:developerKey>?</urn:developerKey>
                      </urn:credential>
                      <urn:param>
                          <urn:name>?</urn:name>
                          <urn:value>?</urn:value>
                      </urn:param>
                    </urn:login>
                </soapenv:Body>
              </soapenv:Envelope>
            `

      const loginResponse = await sf.send({
        method: 'POST',
        path: '/sfapi/v1/soap',
        data: loginPayload,
        headers: {
          'Content-Type': 'text/xml; charset=utf-8',
          'SOAPAction': 'login'
        }
      })

      // Parse session ID from login response XML
      const sessionIdMatch = loginResponse.match(/<sessionId>(.*?)<\/sessionId>/)
      if (!sessionIdMatch) {
        throw new Error('Failed to retrieve SFSF session ID')
      }

      return sessionIdMatch[1]
    }

    async function queryCompoundEmployee(sf, sessionId) {
      const queryPayload = `
                <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:sfobject.sfapi.successfactors.com">
                <soapenv:Header/>
                <soapenv:Body>
                    <urn:query>
                      <urn:queryString>SELECT person, personal_information, employment_information, job_information 
              FROM CompoundEmployee</urn:queryString>
                      <urn:param>
                          <urn:name>maxRows</urn:name>
                          <urn:value>1</urn:value>
                      </urn:param>
                    </urn:query>
                </soapenv:Body>
              </soapenv:Envelope>
            `

      const response = await sf.send({
        method: 'POST',
        path: '/sfapi/v1/soap',
        data: queryPayload,
        headers: {
          'Content-Type': 'text/xml; charset=utf-8',
          'SOAPAction': 'query',
          'Cookie': `JSESSIONID=${sessionId}`   // <-- session passed as cookie
        }
      })

      return response
    }

    function parseCompoundEmployeeResponse(xmlString) {
        const parser = new XMLParser();
        const jsonObj = parser.parse(xmlString);

        const envelope = jsonObj['S:Envelope'];
        const body = envelope['S:Body'];
        const queryResponse = body['queryResponse'];
        const person = queryResponse.result.sfobject.person;
        const empId = person['person_id_external'];

        const personal_information = person['personal_information'];
        const firstName = personal_information['first_name'];
        const lastName = personal_information['last_name'];
        const maritalStatus = personal_information['marital_status'];

        const employmentInformation = person['employment_information']
        const dateOfJoining = employmentInformation['firstDateWorked'];
       
        const jobInformation = person['employment_information']['job_information'][0];
        const locationCode = jobInformation['company_territory_code'];
        const managerID = jobInformation['manager_id'];
        const location = jobInformation['location'];
        const costCenter = jobInformation['cost_center'];
        const department = jobInformation['department'];
        const division = jobInformation['division'];

        return { empId, firstName, lastName, dateOfJoining, location, managerID, maritalStatus, locationCode, costCenter, department, division }

  }

});