USE KENAP
GO

If (object_id('vETLDimPriceTableData') is not null) Drop View vETLDimPriceTableData;
go
CREATE VIEW vETLDimPriceTableData AS 
SELECT DISTINCT
[Type] AS [_Type]
FROM [KENAP_DB].dbo.Price_Table
go

MERGE INTO Dim_Price_Table as TT
	USING vETLDimPriceTableData as ST
		ON TT._Type = ST._Type
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST._Type
					)
			;

Drop View vETLDimPriceTableData;

SELECT * FROM Dim_Price_Table