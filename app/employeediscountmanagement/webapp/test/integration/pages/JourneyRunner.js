sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"employeediscountmanagement/test/integration/pages/EmployeesList",
	"employeediscountmanagement/test/integration/pages/EmployeesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('employeediscountmanagement') + '/test/flpSandbox.html#employeediscountmanagement-tile',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage
        },
        async: true
    });

    return runner;
});

