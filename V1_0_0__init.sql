CREATE TABLE products (
  product_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  form_factor TEXT,
  weight NUMERIC,
  brand TEXT
);


CREATE TABLE product_identifiers (
  identifier_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID REFERENCES products(product_id),
  identifier_type TEXT,
  identifier_value TEXT
);

CREATE TABLE prices (
  price_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID REFERENCES products(product_id),
  store_id UUID REFERENCES stores(store_id),
  price NUMERIC(10, 2),
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  currency TEXT
);

CREATE TABLE stores (
  store_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT,
  location TEXT
);

