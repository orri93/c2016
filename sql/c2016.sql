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
  contact_id INTEGER NOT NULL
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

CREATE TABLE resource_measure(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  measure VARCHAR(32) UNIQUE NOT NULL
);

INSERT INTO resource_measure(measure) VALUES ('mL');
INSERT INTO resource_measure(measure) VALUES ('L');
INSERT INTO resource_measure(measure) VALUES ('kg');

CREATE TABLE resource(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(256) NOT NULL,
  second_name TEXT NULL,
  resource_category_id INTEGER NULL,
  vender_product_number VARCHAR(128) NULL,
  quantity REAL NULL,
  measure_id INTEGER NULL,
  price REAL NULL,
  currency CHAR(3) NULL
);

CREATE TABLE purchase_order(
  id INTEGER UNIQUE PRIMARY KEY NOT NULL,
  date CHAR(10) NOT NULL,
  vendor_id INTEGER NOT NULL,
  ship_to_contact_id INTEGER NOT NULL
);

CREATE TABLE purchase_order_item(
  id INTEGER UNIQUE PRIMARY KEY NOT NULL,
  purchase_order_id INTEGER NOT NULL,
  resource_id INTEGER NOT NULL,
  description VARCHAR(256) NULL,
  quantity REAL NOT NULL,
  unit_price REAL NOT NULL
);
