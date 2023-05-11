USE KENAP
GO

If (object_id('vETLDimCarData') is not null) Drop View vETLDimCarData;
go

CREATE VIEW vETLDimCarData
AS
SELECT DISTINCT
	[Type] AS [Type]
FROM KENAP_DB.dbo.Price_Table;
go

MERGE INTO Dim_Price_Table as TT
	USING vETLDimCarData as ST
		ON TT.[_Type] = ST.[Type]
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.[Type]
					)
			;

Drop View vETLDimCarData;

SELECT * FROM Dim_Car
SELECT * FROM Dim_Price_Table