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
