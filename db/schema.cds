namespace employeeDiscount;

entity Employees {
  key ID: UUID;
  employeeID: String(10) @assert.unique @mandatory;
  firstName: String(99);
  lastName: String(99);
  email: String(99);
  phone: String(10);
  role: String(4);
  dateOfBirth: Date;
  dateOfJoining: Date;
  department: String(4);
  org: String(6);
  managerID: String(10);
  eligibilityStatus: Boolean;
  Workplaces: Association to many Workplaces on Workplaces.employees = $self;
  Cards: Association to many Cards on Cards.employees = $self;
  Partners: Association to many Partners on Partners.employees = $self;
}

entity Workplaces {
  key ID: UUID;
  workplaceID: String(10) @assert.unique @mandatory;
  workplaceName: String(99);
  region: String(4);
  country: String(3);
  city: String(99);
  pin: String(6);
  correspondenceAddress: String(255);
  brand: String(4);
  countryHeadID: String(10);
  Offers: Association to many Offers on Offers.workplaces = $self;
  employees: Association to Employees;
}

entity Partners {
  key ID: UUID;
  partnerID: String(10) @assert.unique @mandatory;
  firstName: String(99);
  lastName: String(99);
  type: String(2);
  dateOfBirth: Date;
  status: Boolean;
  phone: String(10);
  email: String(99);
  relationshipProof: Boolean;
  cardID: String(25);
  employees: Association to Employees;
}

entity Cards {
  key ID: UUID;
  cardNumber: String(25) @assert.unique @mandatory;
  cardName: String(99);
  cardType: String(2);
  issueDate: Date;
  expiryDate: Date;
  limit0: Integer;
  status: Boolean;
  issuedBy: String(10);
  currency: String(3);
  Offers: Association to many Offers on Offers.cards = $self;
  employees: Association to Employees;
}

entity Offers {
  key ID: UUID;
  offerID: String(10) @assert.unique @mandatory;
  offerText: String(255);
  validFrom: Date;
  validTo: Date;
  status: Boolean;
  applicableCategories: String(4);
  discountPercent: Integer;
  workplaces: Association to Workplaces;
  cards: Association to Cards;
}
