 ---
  What is AMS in CAP?

  AMS (Authorization Management Service) uses policies instead of roles. Instead of assigning roles like discount.admin directly to users, you define policy files (DCL) that describe what each policy can do.

  ---
  How it differs from classic roles

  ┌────────────────────┬─────────────────────────────────────┬────────────────────────────────────┐
  │                    │            Classic Roles            │            AMS Policies            │
  ├────────────────────┼─────────────────────────────────────┼────────────────────────────────────┤
  │ User config        │ "roles": ["discount.admin"]         │ "policies": ["cap.ContentManager"] │
  ├────────────────────┼─────────────────────────────────────┼────────────────────────────────────┤
  │ Service annotation │ @requires: 'discount.admin'         │ @requires: 'authenticated-user'    │
  ├────────────────────┼─────────────────────────────────────┼────────────────────────────────────┤
  │ Access control     │ @restrict: { to: 'discount.admin' } │ Defined in .dcl policy files       │
  ├────────────────────┼─────────────────────────────────────┼────────────────────────────────────┤
  │ Where clause       │ where: 'employeeID = $user'         │ Defined in DCL as instance filters │
  └────────────────────┴─────────────────────────────────────┴────────────────────────────────────┘

  ---
  Changes needed in your service

  With AMS you remove role-based restrictions from the service and delegate all access control to DCL policy files:

  // No @requires with specific roles
  // No @restrict with role-based grants
  service DiscountService @(requires: 'authenticated-user') {

    @odata.draft.enabled
    entity Employees as projection on discount.Employees;

    entity Workplaces as projection on discount.Workplaces;

    entity Cards      as projection on discount.Cards;

    entity Offers     as projection on discount.Offers;

    entity Partners   as projection on discount.Partners;
  }

  ---
  DCL Policy files

  Create a folder ams/dcl/ in your project and add policy files:

  ams/dcl/cap/ContentManager.dcl
  POLICY cap.ContentManager {
    GRANT CREATE, READ, UPDATE, DELETE
    ON DiscountService.Employees,
       DiscountService.Workplaces,
       DiscountService.Cards,
       DiscountService.Offers,
       DiscountService.Partners;
  }

  ams/dcl/cap/StockManager.dcl (equivalent to your discount.employee)
  POLICY cap.StockManager {
    GRANT READ
    ON DiscountService.Employees
    WHERE employeeID = $user.id;

    GRANT READ
    ON DiscountService.Cards,
       DiscountService.Offers,
       DiscountService.Partners;
  }

  ---
  Update package.json to point to DCL files

  {
    "cds": {
      "requires": {
        "auth": {
          "[development]": {
            "kind": "mocked",
            "users": {
              "content-manager": {
                "policies": ["cap.ContentManager"]
              },
              "stock-manager": {
                "policies": ["cap.StockManager"]
              }
            }
          },
          "[production]": {
            "kind": "ams"
          }
        },
        "ams": {
          "dcl": "./ams/dcl"
        }
      }
    }
  }

  ---
  Side by side comparison for your use case

  ┌────────────────────────┬───────────────────────────────────────────────────────────┬───────────────────────────────────────────────┐
  │     What you want      │                       Classic roles                       │                      AMS                      │
  ├────────────────────────┼───────────────────────────────────────────────────────────┼───────────────────────────────────────────────┤
  │ Admin full access      │ @restrict: { grant: '*', to: 'discount.admin' }           │ GRANT CREATE, READ, UPDATE, DELETE in DCL     │
  ├────────────────────────┼───────────────────────────────────────────────────────────┼───────────────────────────────────────────────┤
  │ Employee read own data │ @restrict: { grant: 'READ', where: 'employeeID = $user' } │ GRANT READ WHERE employeeID = $user.id in DCL │
  ├────────────────────────┼───────────────────────────────────────────────────────────┼───────────────────────────────────────────────┤
  │ Service annotation     │ @requires: ['discount.admin', 'discount.employee']        │ @requires: 'authenticated-user'               │
  └────────────────────────┴───────────────────────────────────────────────────────────┴───────────────────────────────────────────────┘
