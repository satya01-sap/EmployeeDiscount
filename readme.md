# Getting Started

Employee Discount FullStack SAP CAP Application. 

## Business requirement.

`
Implement a fullstack CAP Application for  employee discount management system.

Use Below Data Model

**Employee** 
_*EmployeeID: String(10)_ 
FirstName: String(99) 
LastName: String(99) 
Email: String(99) 
Phone: String(10) 
Role: String(4) 
DateOfBirth: Date 
DateOfJoining/HireDate: Date 
Department: String(4) 
Org: String(6) 
ManagerID: String(10) 
EligibilityStatus: Boolean 

 
Workplace 
*WorkplaceID: String(10) 
WorkplaceName: String(99) 
Region: String(4) 
Country: Country 
City: String(99) 
PIN: String(6) 
CorrespondenceAddress: AddressType  
Brand: String(4) 
CountryHeadID: String(10) 

Partner 
*PartnerID(PK): String(10) 
FirstName: String(99) 
LastName: String(99) 
Type(Husband/Wife): String(2) 
DateOfBirth: Date 
Status: Boolean 
Phone: String(10) 
Email: String(99) 
RelationshipProof: Boolean 
CardID: String(25) 


Card 
*CardNumber(PK): String(25) 
CardName: String(99) 
CardType:  String(2) 
IssueDate: Date 
ExpiryDate: Date 
Limit: Integer 
Status: Boolean 
IssuedBy: String(10) 
Currency: Currency 

 
Offers 
*OfferID(PK): String(10) 
OfferText: String(255) 
ValidFrom: Date 
ValidTo: Date 
Status: Boolean 
ApplicableCategories: : String(4) 
DiscountPercent: Integer 



Association Summary:- 
Employee    →   Workplace  (Many-to-One) 
Employee    →   Card           (One-to-One) 
Employee    →   Partner       (One-to-One) 
Card            →   Offers         (Many-to-Many) 
Workplace   →   Offers         (One-to-Many) 
 
here * indicate key fields
`



It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.
