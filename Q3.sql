-- Q1 - List the names of customers who have ordered CDs or Disks

SELECT Name
FROM Customer, StandingOrder
Where Customer.Cust# = StandingOrder.Cust#
AND StandingOrder.Cust# IN (
    Select StandingOrder.Cust#
    FROM Item, StandingOrder
    WHERE StandingOrder.Item# = Item.Item#
    AND (Item.Description = 'CD' OR Item.Description = 'Disks')
);

-- SELECT Name
-- FROM Customer, StandingOrder
-- WHERE StandingOrder.Cust# = Customer.Cust#
-- AND (Item# = 'I1' OR Item# = 'I2');


-- Results Should be:
--     BBC Wales
--     Pyramid

-- Q2 - Find how many orders contain either Cartridges or Papers.

SELECT (COUNT('Papers') + COUNT('Cartridges')) AS Answer
FROM StandingOrder, Item
WHERE StandingOrder.Item# = Item.Item#
AND Item.Item# IN (
    SELECT Item#
    FROM Item
    WHERE Description = 'Papers' OR Description = 'Cartridges'
);

-- Result Should be:
-- 2 or 10


-- Q3 - List every item and the total number of customers who have ordered it.

SELECT Description, COUNT(Cust#) AS Total_Customers
FROM StandingOrder, Item
WHERE Item.Item# = StandingOrder.Item#
GROUP BY Description;

-- Result Should be:
-- Cartridges - 1
-- Paper - 1
-- Pen - 1
-- Toner - 1
-- CD - 1
-- Disks - 1


-- Q4 - Find the invoices that cover at least two deliveries.

SELECT Inv#, COUNT(D#) AS Deliveries_Covered
FROM Delivery
WHERE Inv# IN (
    SELECT Inv#
    FROM Delivery
    GROUP BY Inv#
    HAVING COUNT(D#) > 2
)
GROUP BY Inv#
ORDER BY Inv#;

-- Results Should Be:
-- I1
-- I2
-- I3
-- I4
-- I5

-- Q5 - Find the invoices that have not been fully paid yet.
SELECT Total
FROM Invoice
WHERE Total NOT IN (
    SELECT SUM(DeliveredQty.Quantity * Item.Price) AS Total
    FROM DeliveredQty, StandingOrder, Item
    WHERE DeliveredQty.Order# = StandingOrder.Order#
    AND StandingOrder.Item# = Item.Item#
    GROUP BY StandingOrder.Cust#
);

-- Results Should be
-- No rows selected
