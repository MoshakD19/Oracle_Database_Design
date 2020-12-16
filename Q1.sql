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
