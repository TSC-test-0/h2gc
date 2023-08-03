namespace guitarStore;

entity Product {
  key ID: UUID;
  productName: String(200);
  productDescription: String(500);
  price: Decimal(10,2);
  targetAudience: Association to Audience;
  warehouseStock: Association to Warehouse;
  discounts: Composition of many Discount on discounts.product = $self;
}

entity Audience {
  key ID: UUID;
  audiencePitch: String(500);
  products: Association to many Product on products.targetAudience = $self;
}

entity Warehouse {
  key ID: UUID;
  stockQuantity: Integer;
  products: Association to many Product on products.warehouseStock = $self;
}

entity Discount {
  key ID: UUID;
  discountPercentage: Decimal(5,2);
  product: Association to Product;
}

