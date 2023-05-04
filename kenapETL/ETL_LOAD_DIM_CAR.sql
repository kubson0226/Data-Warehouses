USE KENAP
GO

If (object_id('vETLDimCarData') is not null) Drop View vETLDimCarData;
go

CREATE VIEW vETLDimCarData
AS
SELECT DISTINCT
	[License_Plate] as [License_Plate],
	[Brand] as [Brand],
	[Model] as [Model],
	CASE
		WHEN [Car_Type] = 'H' THEN 1
		WHEN [Car_Type] = 'L' THEN 2
		ELSE 3
	END AS [Type_sid],
	YEAR([Prod_year]) as [Prod_Year]
FROM KENAP_DB.dbo.Car;
go

MERGE INTO Dim_Car as TT
	USING vETLDimCarData as ST
		ON TT.License_Plate = ST.License_Plate
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.License_Plate, ST.Brand, ST.Type_sid, ST.Model, ST.Prod_Year 
					)
			;

Drop View vETLDimCarData;

SELECT * FROM Dim_Car

SELECT * FROM KENAP_DB.dbo.Car