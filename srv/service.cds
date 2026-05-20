using { employeeDiscount } from '../db/schema.cds';

service employeeDiscountSrv {
  @odata.draft.enabled
  entity Employees as projection on employeeDiscount.Employees;
  entity Workplaces as projection on employeeDiscount.Workplaces;
  entity Partners as projection on employeeDiscount.Partners;
  entity Cards as projection on employeeDiscount.Cards;
  entity Offers as projection on employeeDiscount.Offers;
}