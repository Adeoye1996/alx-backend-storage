-- Create a trigger that reduces the quantity of an item
-- after a new order is inserted.
-- Note: The quantity in the items table can be negative.
-- Context: Updating multiple tables for a single action
-- from your application can cause issues such as network
-- disconnections or crashes. To ensure data consistency,
-- let MySQL handle it with a trigger.

CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;
