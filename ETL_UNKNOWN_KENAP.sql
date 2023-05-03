use KENAP
go
---CAR DIMENSION
SET IDENTITY_INSERT Dim_Car ON;  
GO 
INSERT INTO Dim_Car(
	  Car_SID, License_Plate, Brand, Type_sid, Model, Prod_Year) 
Values(-1, 'UNKNOWN', 'UNKNOWN', NULL, '', NULL);
go
SET IDENTITY_INSERT Dim_Car OFF;  
GO 
---CUSTOMER DIMENSION
SET IDENTITY_INSERT Dim_Customer ON;  
GO 
INSERT INTO Dim_Customer(
	  Customer_SID, PESEL, _Name, Surname, Date_of_birth, Gender, City, Age_Category, Activation_Date, Disactivation_Date, Is_Active) 
Values(-1, 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '', '', '', '', '1980-01-01', NULL, 1);
go
SET IDENTITY_INSERT Dim_Customer OFF;  
GO 
---PRICE DIMENSION
SET IDENTITY_INSERT Dim_Price_Table ON;  
GO 
INSERT INTO Dim_Price_Table(
	  Type_SID, _Type) 
Values(-1, '');
go
SET IDENTITY_INSERT Dim_Price_Table OFF;  
GO
---RENTING POINT DIMENSION
SET IDENTITY_INSERT Dim_Renting_Point ON;  
GO 
INSERT INTO Dim_Renting_Point(
	  Point_SID, City, _Address, Postal_Code) 
Values(-1, 'UNKNOWN', '', '');
go
SET IDENTITY_INSERT Dim_Renting_Point OFF;  
GO 
---RESERVATION CATEGORY DIMENSION
SET IDENTITY_INSERT Dim_Reservation_Info ON;  
GO 
INSERT INTO Dim_Reservation_Info(
	  Category_SID, Reserv_category, _Status) 
Values(-1, '', '');
go
SET IDENTITY_INSERT Dim_Reservation_Info OFF;  
GO 
---DATE DIMENSION
SET IDENTITY_INSERT Dim_Date ON;  
GO 
INSERT INTO Dim_Date(
	  Date_SID, _Date, _Year, _Month, MonthNo, _Day) 
Values(-1, '', '', 'UNKNOWN', '', '');
go
SET IDENTITY_INSERT Dim_Reservation_Info OFF;  
GO 

SELECT * FROM
Dim_Car

SELECT * FROM
Dim_Customer

SELECT * FROM
Dim_Price_Table

SELECT * FROM
Dim_Renting_Point

SELECT * FROM
Dim_Reservation_Info

SELECT * FROM
Dim_Date