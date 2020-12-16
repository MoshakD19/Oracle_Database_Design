-- Initial Commands
CLEAR SCREEN;

-- Collumn Formatting
COLUMN Description FORMAT A11 HEADING 'Description';
COLUMN Name FORMAT A20 HEADING 'Customer|Name';
COLUMN D# FORMAT A8 HEADING 'Delivery|No';
COLUMN Item# FORMAT A7 HEADING 'Item No';
COLUMN Price FORMAT 90.99 HEADING 'Price';
COLUMN Cost FORMAT 990.99 HEADING 'Cost';
COLUMN Quantity HEADING 'Quantity';

-- Result Formatting
SET FEEDBACK OFF;
SET PAGESIZE 80;
SET LINESIZE 80;
SET UNDERLINE =;

-- Breaks and Computes
BREAK ON Name SKIP 2 ON D# SKIP 1;
COMPUTE SUM OF Cost ON Name;

-- Query
SELECT Name, D#, StandingOrder.Item#, Description, Quantity, Price, (Price * Quantity) Cost
FROM Customer, DeliveredQty, Item, StandingOrder
WHERE Customer.Cust# = StandingOrder.Cust#
AND DeliveredQty.Order# = StandingOrder.Order#
AND StandingOrder.Item# = Item.Item#
ORDER BY Name, D#;



-- Reset Settings
CLEAR BREAKS;
CLEAR COLUMNS;
clear COMPUTES;
SET FEEDBACK ON;
