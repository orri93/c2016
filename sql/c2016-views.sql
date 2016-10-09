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

CREATE VIEW IF NOT EXISTS purchase_order_report AS SELECT
  purchase_order.id,
  purchase_order.date,
  purchase_order.vendor_id,
  vendor.name AS vendor_name,
  vendor.contact_id AS vendor_contact_id,
  vendor_contact.name AS vendor_contact_name,
  vendor_contact.sid AS vendor_contact_sid,
  vendor_contact.address AS vendor_contact_address,
  
  purchase_order.ship_to_contact_id,
  ship_to_contact.name as ship_to_contact_name,
  ship_to_contact.sid AS ship_to_contact_sid,
  ship_to_contact.address AS ship_to_contact_address
  
  FROM purchase_order
  INNER JOIN vendor ON
    purchase_order.vendor_id = vendor.id
  INNER JOIN contact AS vendor_contact ON
    vendor.contact_id = vendor_contact.id
  INNER JOIN contact AS ship_to_contact ON
    purchase_order.ship_to_contact_id = ship_to_contact.id;
