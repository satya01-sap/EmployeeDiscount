using { employeeDiscountSrv } from '../../srv/service.cds';

annotate employeeDiscountSrv.Employees with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate employeeDiscountSrv.Employees with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate employeeDiscountSrv.Employees with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate employeeDiscountSrv.Employees with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName', ID: 'FirstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName', ID: 'LastName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email', ID: 'Email' }
];
annotate employeeDiscountSrv.Employees with @UI.HeaderInfo: {
  TypeName: 'Employee',
  TypeNamePlural: 'Employees',
  Title: { Value: employeeID }
};
annotate employeeDiscountSrv.Employees with {
  ID @UI.Hidden
};
annotate employeeDiscountSrv.Employees with @UI.Identification: [{ Value: employeeID }];
annotate employeeDiscountSrv.Employees with {
  employeeID @Common.Label: 'Employee ID';
  firstName @Common.Label: 'First Name';
  lastName @Common.Label: 'Last Name';
  email @Common.Label: 'Email';
  phone @Common.Label: 'Phone';
  role @Common.Label: 'Role';
  dateOfBirth @Common.Label: 'Date Of Birth';
  dateOfJoining @Common.Label: 'Date Of Joining';
  department @Common.Label: 'Department';
  org @Common.Label: 'Org';
  managerID @Common.Label: 'Manager ID';
  eligibilityStatus @Common.Label: 'Eligibility Status';
  Workplaces @Common.Label: 'Workplaces';
  Cards @Common.Label: 'Cards';
  Partners @Common.Label: 'Partners'
};
annotate employeeDiscountSrv.Employees with {
  ID @Common.Text: { $value: employeeID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeDiscountSrv.Employees with @UI.SelectionFields : [
 employeeID,
 firstName,
 lastName,
 email,
 phone,
 role,
 dateOfBirth,
 dateOfJoining,
 department,
 org,
 managerID,
 eligibilityStatus
];
annotate employeeDiscountSrv.Employees with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: employeeID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Value: dateOfBirth },
    { $Type: 'UI.DataField', Value: dateOfJoining },
    { $Type: 'UI.DataField', Value: department },
    { $Type: 'UI.DataField', Value: org },
    { $Type: 'UI.DataField', Value: managerID },
    { $Type: 'UI.DataField', Value: eligibilityStatus }
];
annotate employeeDiscountSrv.Employees with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: employeeID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Value: dateOfBirth },
    { $Type: 'UI.DataField', Value: dateOfJoining },
    { $Type: 'UI.DataField', Value: department },
    { $Type: 'UI.DataField', Value: org },
    { $Type: 'UI.DataField', Value: managerID },
    { $Type: 'UI.DataField', Value: eligibilityStatus }
]};
annotate employeeDiscountSrv.Workplaces with @UI.LineItem #Employees_Workplaces: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: workplaceID },
    { $Type: 'UI.DataField', Value: workplaceName },
    { $Type: 'UI.DataField', Value: region },
    { $Type: 'UI.DataField', Value: country },
    { $Type: 'UI.DataField', Value: city },
    { $Type: 'UI.DataField', Value: pin },
    { $Type: 'UI.DataField', Value: correspondenceAddress },
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: countryHeadID }
];
annotate employeeDiscountSrv.Cards with @UI.LineItem #Employees_Cards: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: cardNumber },
    { $Type: 'UI.DataField', Value: cardName },
    { $Type: 'UI.DataField', Value: cardType },
    { $Type: 'UI.DataField', Value: issueDate },
    { $Type: 'UI.DataField', Value: expiryDate },
    { $Type: 'UI.DataField', Value: limit0 },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: issuedBy },
    { $Type: 'UI.DataField', Value: currency }
];
annotate employeeDiscountSrv.Partners with @UI.LineItem #Employees_Partners: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: partnerID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: type },
    { $Type: 'UI.DataField', Value: dateOfBirth },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: relationshipProof },
    { $Type: 'UI.DataField', Value: cardID }
];
annotate employeeDiscountSrv.Employees with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'Workplaces', Label: 'Workplaces', Target: 'Workplaces/@UI.LineItem#Employees_Workplaces' },
  { $Type: 'UI.ReferenceFacet', ID: 'Cards', Label: 'Cards', Target: 'Cards/@UI.LineItem#Employees_Cards' },
  { $Type: 'UI.ReferenceFacet', ID: 'Partners', Label: 'Partners', Target: 'Partners/@UI.LineItem#Employees_Partners' }
];
annotate employeeDiscountSrv.Workplaces with {
  employees @Common.ValueList: {
    CollectionPath: 'Employees',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employees_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employeeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'role'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfBirth'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfJoining'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'department'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'org'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'managerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'eligibilityStatus'
      },
    ],
  }
};
annotate employeeDiscountSrv.Workplaces with @UI.DataPoint #workplaceName: {
  Value: workplaceName,
  Title: 'Workplace Name',
};
annotate employeeDiscountSrv.Workplaces with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#workplaceName', ID: 'WorkplaceName' }
];
annotate employeeDiscountSrv.Workplaces with @UI.HeaderInfo: {
  TypeName: 'Workplace',
  TypeNamePlural: 'Workplaces',
  Title: { Value: workplaceID }
};
annotate employeeDiscountSrv.Workplaces with {
  ID @UI.Hidden
};
annotate employeeDiscountSrv.Workplaces with @UI.Identification: [{ Value: workplaceID }];
annotate employeeDiscountSrv.Workplaces with {
  workplaceID @Common.Label: 'Workplace ID';
  workplaceName @Common.Label: 'Workplace Name';
  region @Common.Label: 'Region';
  country @Common.Label: 'Country';
  city @Common.Label: 'City';
  pin @Common.Label: 'Pin';
  correspondenceAddress @Common.Label: 'Correspondence Address';
  brand @Common.Label: 'Brand';
  countryHeadID @Common.Label: 'Country Head ID';
  Offers @Common.Label: 'Offers';
  employees @Common.Label: 'Employee'
};
annotate employeeDiscountSrv.Workplaces with {
  ID @Common.Text: { $value: workplaceID, ![@UI.TextArrangement]: #TextOnly };
  employees @Common.Text: { $value: employees.employeeID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeDiscountSrv.Workplaces with @UI.SelectionFields: [
  employees_ID
];
annotate employeeDiscountSrv.Workplaces with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: workplaceID },
    { $Type: 'UI.DataField', Value: workplaceName },
    { $Type: 'UI.DataField', Value: region },
    { $Type: 'UI.DataField', Value: country },
    { $Type: 'UI.DataField', Value: city },
    { $Type: 'UI.DataField', Value: pin },
    { $Type: 'UI.DataField', Value: correspondenceAddress },
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: countryHeadID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
];
annotate employeeDiscountSrv.Workplaces with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: workplaceID },
    { $Type: 'UI.DataField', Value: workplaceName },
    { $Type: 'UI.DataField', Value: region },
    { $Type: 'UI.DataField', Value: country },
    { $Type: 'UI.DataField', Value: city },
    { $Type: 'UI.DataField', Value: pin },
    { $Type: 'UI.DataField', Value: correspondenceAddress },
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: countryHeadID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
]};
annotate employeeDiscountSrv.Offers with @UI.LineItem #Workplaces_Offers: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: offerID },
    { $Type: 'UI.DataField', Value: offerText },
    { $Type: 'UI.DataField', Value: validFrom },
    { $Type: 'UI.DataField', Value: validTo },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: applicableCategories },
    { $Type: 'UI.DataField', Value: discountPercent },
    { $Type: 'UI.DataField', Label: 'Card', Value: cards_ID }
];
annotate employeeDiscountSrv.Workplaces with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'Offers', Label: 'Offers', Target: 'Offers/@UI.LineItem#Workplaces_Offers' }
];
annotate employeeDiscountSrv.Partners with {
  employees @Common.ValueList: {
    CollectionPath: 'Employees',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employees_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employeeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'role'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfBirth'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfJoining'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'department'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'org'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'managerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'eligibilityStatus'
      },
    ],
  }
};
annotate employeeDiscountSrv.Partners with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate employeeDiscountSrv.Partners with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate employeeDiscountSrv.Partners with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName', ID: 'FirstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName', ID: 'LastName' }
];
annotate employeeDiscountSrv.Partners with @UI.HeaderInfo: {
  TypeName: 'Partner',
  TypeNamePlural: 'Partners',
  Title: { Value: partnerID }
};
annotate employeeDiscountSrv.Partners with {
  ID @UI.Hidden
};
annotate employeeDiscountSrv.Partners with @UI.Identification: [{ Value: partnerID }];
annotate employeeDiscountSrv.Partners with {
  partnerID @Common.Label: 'Partner ID';
  firstName @Common.Label: 'First Name';
  lastName @Common.Label: 'Last Name';
  type @Common.Label: 'Type';
  dateOfBirth @Common.Label: 'Date Of Birth';
  status @Common.Label: 'Status';
  phone @Common.Label: 'Phone';
  email @Common.Label: 'Email';
  relationshipProof @Common.Label: 'Relationship Proof';
  cardID @Common.Label: 'Card ID';
  employees @Common.Label: 'Employee'
};
annotate employeeDiscountSrv.Partners with {
  ID @Common.Text: { $value: partnerID, ![@UI.TextArrangement]: #TextOnly };
  employees @Common.Text: { $value: employees.employeeID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeDiscountSrv.Partners with @UI.SelectionFields: [
  employees_ID
];
annotate employeeDiscountSrv.Partners with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: partnerID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: type },
    { $Type: 'UI.DataField', Value: dateOfBirth },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: relationshipProof },
    { $Type: 'UI.DataField', Value: cardID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
];
annotate employeeDiscountSrv.Partners with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: partnerID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: type },
    { $Type: 'UI.DataField', Value: dateOfBirth },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: relationshipProof },
    { $Type: 'UI.DataField', Value: cardID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
]};
annotate employeeDiscountSrv.Partners with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate employeeDiscountSrv.Cards with {
  employees @Common.ValueList: {
    CollectionPath: 'Employees',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employees_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employeeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'role'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfBirth'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateOfJoining'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'department'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'org'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'managerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'eligibilityStatus'
      },
    ],
  }
};
annotate employeeDiscountSrv.Cards with @UI.DataPoint #cardName: {
  Value: cardName,
  Title: 'Card Name',
};
annotate employeeDiscountSrv.Cards with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cardName', ID: 'CardName' }
];
annotate employeeDiscountSrv.Cards with @UI.HeaderInfo: {
  TypeName: 'Card',
  TypeNamePlural: 'Cards',
  Title: { Value: cardNumber }
};
annotate employeeDiscountSrv.Cards with {
  ID @UI.Hidden
};
annotate employeeDiscountSrv.Cards with @UI.Identification: [{ Value: cardNumber }];
annotate employeeDiscountSrv.Cards with {
  cardNumber @Common.Label: 'Card Number';
  cardName @Common.Label: 'Card Name';
  cardType @Common.Label: 'Card Type';
  issueDate @Common.Label: 'Issue Date';
  expiryDate @Common.Label: 'Expiry Date';
  limit0 @Common.Label: 'Limit';
  status @Common.Label: 'Status';
  issuedBy @Common.Label: 'Issued By';
  currency @Common.Label: 'Currency';
  Offers @Common.Label: 'Offers';
  employees @Common.Label: 'Employee'
};
annotate employeeDiscountSrv.Cards with {
  ID @Common.Text: { $value: cardNumber, ![@UI.TextArrangement]: #TextOnly };
  employees @Common.Text: { $value: employees.employeeID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeDiscountSrv.Cards with @UI.SelectionFields: [
  employees_ID
];
annotate employeeDiscountSrv.Cards with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: cardNumber },
    { $Type: 'UI.DataField', Value: cardName },
    { $Type: 'UI.DataField', Value: cardType },
    { $Type: 'UI.DataField', Value: issueDate },
    { $Type: 'UI.DataField', Value: expiryDate },
    { $Type: 'UI.DataField', Value: limit0 },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: issuedBy },
    { $Type: 'UI.DataField', Value: currency },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
];
annotate employeeDiscountSrv.Cards with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: cardNumber },
    { $Type: 'UI.DataField', Value: cardName },
    { $Type: 'UI.DataField', Value: cardType },
    { $Type: 'UI.DataField', Value: issueDate },
    { $Type: 'UI.DataField', Value: expiryDate },
    { $Type: 'UI.DataField', Value: limit0 },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: issuedBy },
    { $Type: 'UI.DataField', Value: currency },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employees_ID }
]};
annotate employeeDiscountSrv.Offers with @UI.LineItem #Cards_Offers: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: offerID },
    { $Type: 'UI.DataField', Value: offerText },
    { $Type: 'UI.DataField', Value: validFrom },
    { $Type: 'UI.DataField', Value: validTo },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: applicableCategories },
    { $Type: 'UI.DataField', Value: discountPercent },
    { $Type: 'UI.DataField', Label: 'Workplace', Value: workplaces_ID }
];
annotate employeeDiscountSrv.Cards with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'Offers', Label: 'Offers', Target: 'Offers/@UI.LineItem#Cards_Offers' }
];
annotate employeeDiscountSrv.Offers with {
  workplaces @Common.ValueList: {
    CollectionPath: 'Workplaces',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: workplaces_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'workplaceID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'workplaceName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'region'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'city'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'pin'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'correspondenceAddress'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'brand'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'countryHeadID'
      },
    ],
  }
};
annotate employeeDiscountSrv.Offers with {
  cards @Common.ValueList: {
    CollectionPath: 'Cards',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: cards_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cardNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cardName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cardType'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'issueDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'expiryDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'limit0'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'issuedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'currency'
      },
    ],
  }
};
annotate employeeDiscountSrv.Offers with @UI.DataPoint #offerText: {
  Value: offerText,
  Title: 'Offer Text',
};
annotate employeeDiscountSrv.Offers with @UI.DataPoint #validFrom: {
  Value: validFrom,
  Title: 'Valid From',
};
annotate employeeDiscountSrv.Offers with @UI.DataPoint #validTo: {
  Value: validTo,
  Title: 'Valid To',
};
annotate employeeDiscountSrv.Offers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#offerText', ID: 'OfferText' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#validFrom', ID: 'ValidFrom' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#validTo', ID: 'ValidTo' }
];
annotate employeeDiscountSrv.Offers with @UI.HeaderInfo: {
  TypeName: 'Offer',
  TypeNamePlural: 'Offers',
  Title: { Value: offerID }
};
annotate employeeDiscountSrv.Offers with {
  ID @UI.Hidden
};
annotate employeeDiscountSrv.Offers with @UI.Identification: [{ Value: offerID }];
annotate employeeDiscountSrv.Offers with {
  offerID @Common.Label: 'Offer ID';
  offerText @Common.Label: 'Offer Text';
  validFrom @Common.Label: 'Valid From';
  validTo @Common.Label: 'Valid To';
  status @Common.Label: 'Status';
  applicableCategories @Common.Label: 'Applicable Categories';
  discountPercent @Common.Label: 'Discount Percent';
  workplaces @Common.Label: 'Workplace';
  cards @Common.Label: 'Card'
};
annotate employeeDiscountSrv.Offers with {
  ID @Common.Text: { $value: offerID, ![@UI.TextArrangement]: #TextOnly };
  workplaces @Common.Text: { $value: workplaces.workplaceID, ![@UI.TextArrangement]: #TextOnly };
  cards @Common.Text: { $value: cards.cardNumber, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeDiscountSrv.Offers with @UI.SelectionFields: [
  workplaces_ID,
  cards_ID
];
annotate employeeDiscountSrv.Offers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: offerID },
    { $Type: 'UI.DataField', Value: offerText },
    { $Type: 'UI.DataField', Value: validFrom },
    { $Type: 'UI.DataField', Value: validTo },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: applicableCategories },
    { $Type: 'UI.DataField', Value: discountPercent },
    { $Type: 'UI.DataField', Label: 'Workplace', Value: workplaces_ID },
    { $Type: 'UI.DataField', Label: 'Card', Value: cards_ID }
];
annotate employeeDiscountSrv.Offers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: offerID },
    { $Type: 'UI.DataField', Value: offerText },
    { $Type: 'UI.DataField', Value: validFrom },
    { $Type: 'UI.DataField', Value: validTo },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: applicableCategories },
    { $Type: 'UI.DataField', Value: discountPercent },
    { $Type: 'UI.DataField', Label: 'Workplace', Value: workplaces_ID },
    { $Type: 'UI.DataField', Label: 'Card', Value: cards_ID }
]};
annotate employeeDiscountSrv.Offers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];