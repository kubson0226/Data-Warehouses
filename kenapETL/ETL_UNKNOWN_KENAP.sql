use KENAP
go
Delete Fact_Reservation;
---CAR DIMENSION
DELETE Dim_Car
WHERE Car_SID = -1;
SET IDENTITY_INSERT Dim_Car ON;  
GO 
INSERT INTO Dim_Car(
	  Car_SID, License_Plate, Brand, Type_sid, Model, Prod_Year) 
Values(-1, 'UNKNOWN', 'UNKNOWN', NULL, '', NULL);
go
SET IDENTITY_INSERT Dim_Car OFF;  
GO 
---CUSTOMER DIMENSION
DELETE Dim_Customer
WHERE Customer_SID = -1;
SET IDENTITY_INSERT Dim_Customer ON;  
GO 
INSERT INTO Dim_Customer(
	  Customer_SID, PESEL, _Name, Surname, Date_of_birth, Gender, City, Age_Category, Activation_Date, Disactivation_Date, Is_Active) 
Values(-1, 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '', '', '', '', '1980-01-01', NULL, 1);
go
SET IDENTITY_INSERT Dim_Customer OFF;  
GO 
---RENTING POINT DIMENSION
DELETE Dim_Renting_Point
WHERE Point_SID = 255;
INSERT INTO Dim_Renting_Point(
	  Point_SID, City, _Address, Postal_Code) 
Values(255, 'UNKNOWN', '', '');
go

Delete Dim_Date
WHERE Date_SID = -1;
SET IDENTITY_INSERT Dim_Date ON;  
GO 
INSERT INTO Dim_Date(
	  Date_SID, _Date, _Year, _Month, MonthNo, _Day) 
Values(-1, '', '', 'UNKNOWN', '', '');
go
SET IDENTITY_INSERT Dim_Date OFF;  
GO 

Delete Dim_Price_Table
WHERE Type_SID = -1;
SET IDENTITY_INSERT Dim_Price_Table ON;  
GO 
INSERT INTO Dim_Price_Table(
	  Type_SID, _Type) 
Values(-1, '');
go
SET IDENTITY_INSERT Dim_Price_Table OFF;  
GO 