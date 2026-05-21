sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/dis/discountapp/test/integration/pages/EmployeesList",
	"com/sap/dis/discountapp/test/integration/pages/EmployeesObjectPage",
	"com/sap/dis/discountapp/test/integration/pages/WorkplacesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, WorkplacesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/dis/discountapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheWorkplacesObjectPage: WorkplacesObjectPage
        },
        async: true
    });

    return runner;
});

