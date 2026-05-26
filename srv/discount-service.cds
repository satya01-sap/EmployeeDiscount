using { com.sap.discount as discount } from '../db/discount-schema';
using { sfsf_employeed as external } from './external/sfsf-employeed';


  @(path:'/discount')
  //@requires{'authenticated-user'}
  service DiscountService @(requires: ['authenticated-user'])   {
    //annotate DiscountService.Employees with @fiori.draft.enabled;
    @odata.draft.enabled

  // @restrict: [
  //     { grant: 'DELETE',      to: 'DiscountAdmin'},
  //     { grant: 'READ', to: 'DiscountEmployee', where: (employeeID = $user) }
  // ]

  @restrict: [
      { grant: '*', to: 'DiscountAdmin' },
      { grant: 'READ', to: 'DiscountEmployee', where: 'employeeID = $user.empid'}
  ]
  entity Employees as projection on discount.Employees;

  @readonly
  entity Workplaces as projection on discount.Workplaces;
  
  @readonly
  entity Partners as projection on discount.Partners;

  @restrict:[
    { grant: ['READ', 'CREATE', 'UPDATE' ], to: 'DiscountAdmin' },
    { grant: ['READ'], to: 'DiscountEmployee' },
    { grant: ['UPDATE'], to: 'DiscountEmployee', where: 'employees = $user.empid' }
  ]
  @odata.draft.enabled
  entity Cards as projection on discount.Cards;

  @restrict:[
    { grant: ['READ', 'CREATE', 'UPDATE' ], to: 'DiscountAdmin' },
    { grant: 'READ', to: 'DiscountEmployee' }
  ]
  @odata.draft.enabled
  entity Offers as projection on discount.Offers;

  entity User as projection on external.User;

  
  // entity Employees @(restrict: [{ grant: '*', to: 'discount.admin'} 
  // ]) as projection on discount.Employees;

  // @restrict: [
  //     { grant: 'READ',   to: ['discount.employee', 'discount.admin'] },
  //     { grant: 'CREATE', to: 'discount.employee' },
  //     { grant: 'DELETE', to: 'discount.admin' }
  //   ]
  //   entity Employees as projection on discount.Employees;

  //   @restrict: [
  //     { grant: 'READ',   to: ['discount.employee', 'discount.admin'] },
  //     { grant: 'CREATE', to: 'discount.admin' },
  //     { grant: 'DELETE', to: 'discount.admin' }
  //   ]
  //   entity Workplaces as projection on discount.Workplaces;

  //   @restrict: [
  //     { grant: 'READ',   to: ['discount.employee', 'discount.admin'] },
  //     { grant: 'CREATE', to: 'discount.admin' },
  //     { grant: 'DELETE', to: 'discount.admin' }
  //   ]
  //   entity Cards as projection on discount.Cards;

  //   @restrict: [
  //     { grant: 'READ',   to: ['discount.employee', 'discount.admin'] },
  //     { grant: 'CREATE', to: 'discount.admin' },
  //     { grant: 'DELETE', to: 'discount.admin' }
  //   ]
  //   entity Offers as projection on discount.Offers;

  //   @restrict: [
  //     { grant: 'READ',   to: ['discount.employee', 'discount.admin'] },
  //     { grant: 'CREATE', to: 'discount.employee' },
  //     { grant: 'DELETE', to: 'discount.admin' }
  //   ]
  //   entity Partners as projection on discount.Partners;


}

// @(path:'/admin')
// service AdminService @(requires: 'discount.admin')   {
//   entity Employees as projection on discount.Employees;
//   entity Workplaces as projection on discount.Workplaces;
//   entity Partners as projection on discount.Partners;
//   entity Cards as projection on discount.Cards;
//   entity Offers as projection on discount.Offers;
// }


