USE KENAP
go

If (object_id('CustomerTemp') is not null) Drop TABLE CustomerTemp;
CREATE TABLE CustomerTemp(
PESEL VARCHAR(11),
Name VARCHAR(30),
Surname VARCHAR(30),
Date_of_birth Date,
Gender VARCHAR(7),
Driving_licence_number VARCHAR(255),
Phone_number VARCHAR(9),
Email VARCHAR(255),
Address VARCHAR(255),
City VARCHAR(30))

BULK INSERT CustomerTemp
    FROM 'C:\Kuba_pliki\Studia\Sem 4\Data Warehouses\DataWarehouses-main_KENAP\Bulks\customer2.csv'
    WITH
    (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

---SELECT * FROM CustomerTemp

If (object_id('CustomerTemp') is not null) Drop TABLE CustomerTemp;
CREATE TABLE CustomerTemp(
PESEL VARCHAR(11),
Name VARCHAR(30),
Surname VARCHAR(30),
Date_of_birth Date,
Gender VARCHAR(7),
Driving_licence_number VARCHAR(255),
Phone_number VARCHAR(9),
Email VARCHAR(255),
Address VARCHAR(255),
City VARCHAR(30))

	BULK INSERT CustomerTemp
    FROM 'C:\Kuba_pliki\Studia\Sem 4\Data Warehouses\DataWarehouses-main_KENAP\Bulks\customer2.csv'
    WITH
    (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

---SELECT * FROM CustomerTemp



If (object_id('vETLDimCustomerData') is not null) Drop View vETLDimCustomerData;
go

CREATE VIEW vETLDimCustomerData AS
SELECT DISTINCT 
[PESEL] AS [PESEL],
[Name] AS [Name],
[Surname] AS [Surname],
[Date_of_birth] AS [Date of birth],
CASE
WHEN Gender = 'male' THEN 'M'
WHEN Gender = 'female' THEN 'F'
END AS [Gender],
[City] AS [City],
CASE
	WHEN DATEDIFF(year, [Date_of_birth], CURRENT_TIMESTAMP) < 30 THEN 'Young Adult'
	WHEN DATEDIFF(year, [Date_of_birth], CURRENT_TIMESTAMP) BETWEEN 30 AND 44 THEN 'Middle-age Adult'
	WHEN DATEDIFF(year, [Date_of_birth], CURRENT_TIMESTAMP) >= 45 THEN 'Old-age Adult'
END AS [Age_Category],
CASE 
WHEN (DATEDIFF(year, [Date_of_birth], CURRENT_TIMESTAMP) > 26) THEN '2015-01-01'
ELSE DATEADD(year, 18, [Date_of_birth]) 
END AS [Activation_date],
CONVERT(date, NULL, 23) AS [Disactivation_date],
1 AS [Is_Active]
FROM dbo.CustomerTemp
go

---SELECT * FROM vETLDimCustomerData

-----------------------------------------
-- for testing purposes only!!
Declare @EntryDate date; 
SELECT @EntryDate = '2021-01-10';
--SELECT @EntryDate = '2016-06-30 00:00:00';
-----------------------------------------

MERGE INTO Dim_Customer as TT
	USING vETLDimCustomerData as ST
		ON TT.PESEL = ST.PESEL
			WHEN Not Matched
				THEN
					INSERT Values (
					ST.PESEL,
					ST.[Name],
					ST.Surname,
					ST.[Date of birth],
					ST.Gender,
					ST.City,
					ST.Age_Category,
					ST.Activation_date,
					ST.Disactivation_date,
					ST.Is_Active
					)
			WHEN Matched
				AND ST.City <> TT.City
			THEN
				UPDATE
				SET TT.Is_Active = 0,
				TT.Disactivation_Date = @EntryDate
			;

INSERT INTO Dim_Customer(
	PESEL, 
	_Name, 
	Surname, 
	Date_of_birth, 
	Gender, 
	City, 
	Age_Category, 
	Activation_Date,
	Disactivation_Date, 
	Is_Active
	)
	SELECT 
		PESEL, 
		[Name], 
		Surname, 
		[Date of birth], 
		Gender, 
		City, 
		Age_Category,
		@EntryDate,
		NULL,
		1
	FROM vETLDimCustomerData
	EXCEPT
	SELECT 
		PESEL, 
		_Name, 
		Surname, 
		Date_of_birth, 
		Gender, 
		City, 
		Age_Category, 
		@EntryDate, 
		NULL, 
		1
	FROM Dim_Customer;

SELect * from Dim_Customer;
DROP VIEW vETLDimCustomerData
DROP TABLE CustomerTemp

	SELECT * FROM
	Dim_Customer
	WHERE PESEL = '60060873661'
