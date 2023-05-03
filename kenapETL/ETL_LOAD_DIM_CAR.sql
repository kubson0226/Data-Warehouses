USE KENAP
GO

If (object_id('vETLDimCarData') is not null) Drop View vETLDimCarData;
go

CREATE VIEW vETLDimCarData
AS
SELECT DISTINCT
	[License_Plate] as [License_Plate],
	[Brand] as [Brand],
	[Car_Type] as [Type_sid],
	[Model] as [Model],
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
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLDimCarData;
