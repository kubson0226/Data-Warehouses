USE KENAP
GO

If (object_id('vETLDimCarData') is not null) Drop View vETLDimCarData;
go

CREATE VIEW vETLDimCarData
AS
SELECT
	[License_Plate] as [License_Plate],
	[Brand] as [Brand],
	[Model] as [Model],
	CASE
		WHEN [Car_Type] = 'H' THEN 1
		WHEN [Car_Type] = 'L' THEN 2
		ELSE 3
	END AS [Type_sid],
	YEAR([Prod_year]) as [Prod_Year]
FROM KENAP_DB.dbo.Car
go

If (object_id('Dim_Car_Test') is not null) Drop Table Dim_Car_Test;
go

CREATE TABLE Dim_Car_Test
(Car_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
License_Plate VARCHAR(7),
Brand VARCHAR(30),
Type_sid INT FOREIGN KEY REFERENCES Dim_Price_Table(Type_SID),
Model VARCHAR(30),
Prod_Year INT
)

INSERT INTO Dim_Car_Test (License_Plate, Brand, Model, Type_sid, Prod_Year)
SELECT License_Plate, Brand, Model, Type_sid, Prod_Year FROM vETLDimCarData
ORDER BY License_Plate

SELECT * FROM Dim_Car_Test

MERGE INTO Dim_Car as TT
	USING Dim_Car_Test as ST
		ON TT.License_Plate = ST.License_Plate
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.License_Plate, ST.Brand, ST.Type_sid, ST.Model, ST.Prod_Year 
					)
			;

DROP TABLE Dim_Car_Test;
Drop View vETLDimCarData;

SELECT * 
FROM Dim_Car

---SELECT * FROM KENAP_DB.dbo.Car