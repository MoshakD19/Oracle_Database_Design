-- Question 1

-- Customer Table Creation
CREATE TABLE Customer
    (Cust# varchar2(5),
     Name varchar2(30),
     Address varchar2(50),
     Constraint Customer_PK primary key(Cust#)
);

-- Item Table Creation
CREATE TABLE Item
    (Item# varchar2(5),
     Description varchar2(50) not null,
     Price number(6, 2) not null,
     Weight number(5, 2),
     Constraint Item_PK primary key(Item#)
);

-- Standing Order Table Creation
CREATE TABLE StandingOrder
    (Order# varchar2(7),
     StartDate date not null,
     EndDate date,
     Cust# varchar2(5) not null,
     Item# varchar2(5) not null,
     Constraint Order_PK primary key(Order#),
     Constraint Order_Customer_FK
     foreign key(Cust#)
     references Customer(Cust#),
     Constraint Order_Item_Fk
     foreign key(Item#)
     references Item(Item#)
);

-- Invoice Table Creation
CREATE TABLE Invoice
    (Inv# varchar2(6),
     Inv_Date date not null,
     Total number(6, 2) not null,
     Cust# varchar2(5) not null,
     Constraint Invoice_PK primary key(Inv#),
     Constraint Invoice_Customer_FK
     foreign key(Cust#)
     references Customer(Cust#)
 );

 -- Delivery Table Creation
CREATE TABLE Delivery
    (D# varchar2(9),
     Deliv_Date date not null,
     Inv# varchar2(6) not null,
     Constraint Delivery_PK primary key(D#),
     Constraint Delivery_Invoice_FK
     foreign key(Inv#)
     references Invoice(Inv#)
);

 -- Delivered Quantity Table Creation
CREATE TABLE DeliveredQty
    (Order# varchar2(7),
     D# varchar2(9),
     Quantity number(5, 0) not null,
     Constraint DeliveredQty_PK primary key(Order#, D#),
     Constraint DeliveredQty_Order_FK
     foreign key(Order#)
     references StandingOrder(Order#),
     Constraint DeliveredQty_Delivery_Fk
     foreign key(D#)
     references Delivery(D#)
);


-- Payment Table Creation
CREATE TABLE Payment
    (P# varchar2(7),
     Pay_Date date,
     Cust# varchar2(5),
     Constraint Payment_PK primary key(P#),
     Constraint Payment_Customer_FK
     foreign key(Cust#)
     references Customer(Cust#)
);

-- Covers(P#, Inv#, Amount)
-- Covers Table Creation
CREATE TABLE Covers
    (P# varchar2(7),
     Inv# varchar2(6),
     Amount number(7, 2),
     Constraint Covers_PK primary key(P#, Inv#),
     Constraint Covers_Payment_FK
     foreign key(P#)
     references Payment(P#),
     Constraint Covers_Invoice_FK
     foreign key(Inv#)
     references Invoice(Inv#)
);


-- Question 2


-- Insert data into Customer Table
INSERT ALL
    INTO Customer VALUES ('C1', 'BBC Wales', 'Llantrisant Rad, Cardiff, CF5 2YQ')
    INTO Customer VALUES ('C2', 'Pyramid', 'Cardiff Road, Cardiff, CF5 1AB')
    INTO Customer VALUES ('C3', 'Sony Broadcast', 'London Road, Reading, RD1 2CD')
    INTO Customer VALUES ('C4', 'Thompson Broadcast', 'Reading Road, Slough, SL2 3EF')
    INTO Customer VALUES ('C5', 'Radio Spares', 'London Road, Birmingham, BH3 4GH')
SELECT 1 FROM DUAL;

-- Insert data into Item Table
INSERT ALL
    INTO Item VALUES ('I1', 'CD', 1.50, 0.1)
    INTO Item VALUES ('I2', 'Disks', 1.00, 0.15)
    INTO Item VALUES ('I3', 'Cartridges', 2.00, 0.35)
    INTO Item VALUES ('I4', 'Paper', 3.00, 3.15)
    INTO Item VALUES ('I5', 'Toner', 27.50, 5.75)
    INTO Item VALUES ('I6', 'Pen', 0.25, 0.01)
SELECT 1 FROM DUAL;

-- Insert data into Standing Order Table
INSERT ALL
    INTO StandingOrder VALUES ('SO1', '01-Jan-20', '31-Jan-20', 'C1', 'I1')
    INTO StandingOrder VALUES ('SO2', '01-Jan-20', '31-Jan-20', 'C2', 'I2')
    INTO StandingOrder VALUES ('SO3', '01-Jan-20', '31-Jan-20', 'C3', 'I3')
    INTO StandingOrder VALUES ('SO4', '01-Jan-20', '31-Jan-20', 'C4', 'I4')
    INTO StandingOrder VALUES ('SO5', '01-Jan-20', '31-Jan-20', 'C5', 'I5')
    INTO StandingOrder VALUES ('SO6', '01-Jan-20', '31-Jan-20', 'C5', 'I6')
SELECT 1 FROM DUAL;

-- Insert data into Invoice Table
INSERT ALL
    INTO Invoice VALUES ('I1', '01-Jan-20', 7.50, 'C1')
    INTO Invoice VALUES ('I2', '01-Jan-20', 10.00, 'C2')
    INTO Invoice VALUES ('I3', '01-Jan-20', 30.00, 'C3')
    INTO Invoice VALUES ('I4', '01-Jan-20', 60.00, 'C4')
    INTO Invoice VALUES ('I5', '01-Jan-20', 695.00, 'C5')
SELECT 1 FROM DUAL;

-- Insert into Delivery Table
INSERT ALL
    INTO Delivery VALUES ('D1', '01-Jan-20', 'I1')
    INTO Delivery VALUES ('D2', '01-Jan-20', 'I2')
    INTO Delivery VALUES ('D3', '01-Jan-20', 'I3')
    INTO Delivery VALUES ('D4', '01-Jan-20', 'I4')
    INTO Delivery VALUES ('D5', '01-Jan-20', 'I5')
    INTO Delivery VALUES ('D7', '07-Jan-20', 'I1')
    INTO Delivery VALUES ('D8', '07-Jan-20', 'I2')
    INTO Delivery VALUES ('D9', '07-Jan-20', 'I3')
    INTO Delivery VALUES ('D10', '07-Jan-20', 'I4')
    INTO Delivery VALUES ('D11', '07-Jan-20', 'I5')
    INTO Delivery VALUES ('D13', '14-Jan-20', 'I1')
    INTO Delivery VALUES ('D14', '14-Jan-20', 'I2')
    INTO Delivery VALUES ('D15', '14-Jan-20', 'I3')
    INTO Delivery VALUES ('D16', '14-Jan-20', 'I4')
    INTO Delivery VALUES ('D17', '14-Jan-20', 'I5')
    INTO Delivery VALUES ('D19', '21-Jan-20', 'I1')
    INTO Delivery VALUES ('D20', '21-Jan-20', 'I2')
    INTO Delivery VALUES ('D21', '21-Jan-20', 'I3')
    INTO Delivery VALUES ('D22', '21-Jan-20', 'I4')
    INTO Delivery VALUES ('D23', '21-Jan-20', 'I5')
    INTO Delivery VALUES ('D25', '28-Jan-20', 'I1')
    INTO Delivery VALUES ('D26', '28-Jan-20', 'I2')
    INTO Delivery VALUES ('D27', '28-Jan-20', 'I3')
    INTO Delivery VALUES ('D28', '28-Jan-20', 'I4')
    INTO Delivery VALUES ('D29', '28-Jan-20', 'I5')
SELECT 1 FROM DUAL;

-- Insert data into Delivered Quantity Table
INSERT ALL
    INTO DeliveredQty VALUES ('SO1', 'D1', 1)
    INTO DeliveredQty VALUES ('SO2', 'D2', 2)
    INTO DeliveredQty VALUES ('SO3', 'D3', 3)
    INTO DeliveredQty VALUES ('SO4', 'D4', 4)
    INTO DeliveredQty VALUES ('SO5', 'D5', 5)
    INTO DeliveredQty VALUES ('SO6', 'D5', 6)
    INTO DeliveredQty VALUES ('SO1', 'D7', 1)
    INTO DeliveredQty VALUES ('SO2', 'D8', 2)
    INTO DeliveredQty VALUES ('SO3', 'D9', 3)
    INTO DeliveredQty VALUES ('SO4', 'D10', 4)
    INTO DeliveredQty VALUES ('SO5', 'D11', 5)
    INTO DeliveredQty VALUES ('SO6', 'D11', 6)
    INTO DeliveredQty VALUES ('SO1', 'D13', 1)
    INTO DeliveredQty VALUES ('SO2', 'D14', 2)
    INTO DeliveredQty VALUES ('SO3', 'D15', 3)
    INTO DeliveredQty VALUES ('SO4', 'D16', 4)
    INTO DeliveredQty VALUES ('SO5', 'D17', 5)
    INTO DeliveredQty VALUES ('SO6', 'D17', 6)
    INTO DeliveredQty VALUES ('SO1', 'D19', 1)
    INTO DeliveredQty VALUES ('SO2', 'D20', 2)
    INTO DeliveredQty VALUES ('SO3', 'D21', 3)
    INTO DeliveredQty VALUES ('SO4', 'D22', 4)
    INTO DeliveredQty VALUES ('SO5', 'D23', 5)
    INTO DeliveredQty VALUES ('SO6', 'D23', 6)
    INTO DeliveredQty VALUES ('SO1', 'D25', 1)
    INTO DeliveredQty VALUES ('SO2', 'D26', 2)
    INTO DeliveredQty VALUES ('SO3', 'D27', 3)
    INTO DeliveredQty VALUES ('SO4', 'D28', 4)
    INTO DeliveredQty VALUES ('SO5', 'D29', 5)
    INTO DeliveredQty VALUES ('SO6', 'D29', 6)
SELECT 1 FROM DUAL;



-- Question 3


-- 3A - List the names of customers who have ordered CDs or Disks

SELECT Name
FROM Customer, StandingOrder
Where Customer.Cust# = StandingOrder.Cust#
AND StandingOrder.Cust# IN (
    Select StandingOrder.Cust#
    FROM Item, StandingOrder
    WHERE StandingOrder.Item# = Item.Item#
    AND (Item.Description = 'CD' OR Item.Description = 'Disks')
);

-- 3B - Find how many orders contain either Cartridges or Papers.

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


-- 3C - List every item and the total number of customers who have ordered it.

SELECT Description, COUNT(Cust#)
FROM StandingOrder, Item
WHERE Item.Item# = StandingOrder.Item#
GROUP BY Description;


-- 3D - Find the invoices that cover at least two deliveries.

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

-- 3E - Find the invoices that have not been fully paid yet.
SELECT Total
FROM Invoice
WHERE Total NOT IN (
    SELECT SUM(DeliveredQty.Quantity * Item.Price) AS Total
    FROM DeliveredQty, StandingOrder, Item
    WHERE DeliveredQty.Order# = StandingOrder.Order#
    AND StandingOrder.Item# = Item.Item#
    GROUP BY StandingOrder.Cust#
);


-- Question 4



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
SET UNDERLINE = '=';

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
