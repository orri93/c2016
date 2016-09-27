CREATE TABLE vendor(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(64) UNIQUE NOT NULL
);

CREATE TABLE resource_category (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  category VARCHAR(128) UNIQUE NOT NULL
);

INSERT INTO resource_category(category) VALUES ('Fisher Chemical');
INSERT INTO resource_category(category) VALUES ('Acros Organics');

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