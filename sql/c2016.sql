CREATE TABLE contact(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(128) NOT NULL,
  sid VARCHAR(128) NULL,
  address VARCHAR(128) NULL,
  post_number VARCHAR(128) NULL,
  place VARCHAR(128) NULL,
  country VARCHAR(128) NULL,
  phone VARCHAR(64) NULL,
  email VARCHAR(128) NULL
);

INSERT INTO contact(name, sid, address, post_number, place, country, phone, email) VALUES(
  'Sagos slf.',
  '490207-1470',
  'Langgata 6',
  '4013',
  'Stavanger',
  'Norway',
  '+47 47447044',
  'orri@sagos.is'
);
INSERT INTO contact(name, sid, address, post_number, place, country, phone, email) VALUES(
  'Fisher Scientific AS',
  NULL,
  'Postboks 114 Smestad',
  '0309',
  'Oslo',
  'Norway',
  NULL,
  NULL
);

CREATE TABLE vendor(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(64) UNIQUE NOT NULL,
  contact_id INTEGER NOT NULL,
  
  FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO vendor(name, contact_id) VALUES ('Fisher Chemical', 2);
INSERT INTO vendor(name, contact_id) VALUES ('Acros Organics', 2);

CREATE TABLE resource_category (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  category VARCHAR(128) UNIQUE NOT NULL
);

INSERT INTO resource_category(category) VALUES ('Reagent');
INSERT INTO resource_category(category) VALUES ('Acid');
INSERT INTO resource_category(category) VALUES ('Salt');
INSERT INTO resource_category(category) VALUES ('Solvent');

CREATE TABLE resource(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(256) NOT NULL,
  second_name TEXT NULL,
  resource_category_id INTEGER NULL,
  vendor_id INTEGER NOT NULL,
  vender_product_number VARCHAR(128) NULL,
  quantity REAL NULL,
  measure VARCHAR(32) NULL,
  price REAL NULL,
  currency CHAR(3) NULL,
  
  FOREIGN KEY (resource_category_id) REFERENCES resource_category(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (vendor_id) REFERENCES vendor(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE purchase_order(
  id INTEGER UNIQUE PRIMARY KEY NOT NULL,
  date CHAR(10) NOT NULL,
  vendor_id INTEGER NOT NULL,
  ship_to_contact_id INTEGER NOT NULL,
  
  FOREIGN KEY (vendor_id) REFERENCES vendor(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE purchase_order_item(
  id INTEGER UNIQUE PRIMARY KEY NOT NULL,
  purchase_order_id INTEGER NOT NULL,
  resource_id INTEGER NOT NULL,
  description VARCHAR(256) NULL,
  quantity REAL NOT NULL,
  unit_price REAL NOT NULL,
  
  FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE VIEW IF NOT EXISTS resource_report AS SELECT
  resource.id,
  resource.name,
  resource.second_name,
  resource.resource_category_id,
  resource_category.category AS category,
  resource.vendor_id,
  vendor.name AS vendor_name,
  resource.vender_product_number,
  resource.quantity,
  resource.measure,
  resource.price,
  resource.currency
  FROM resource
  INNER JOIN resource_category ON
    resource.resource_category_id = resource_category.id
  INNER JOIN vendor ON
    resource.vendor_id = vendor.id;
