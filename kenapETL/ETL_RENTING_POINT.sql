USE KENAP
GO

If (object_id('vETLDimRentingData') is not null) Drop View vETLDimRentingData;
go

CREATE TABLE RentingTemp (
[Point_ID] tinyint PRIMARY KEY,
[City] VARCHAR(30),
[Address] VARCHAR(40),
[Postal-code] VARCHAR(6))


BULK INSERT dbo.RentingTemp
    FROM 'C:\Kuba_pliki\Studia\Sem 4\Data Warehouses\DataWarehouses-main_KENAP\Bulks\renting.csv'
    WITH
    (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

SELECT * FROM RentingTemp

CREATE VIEW vETLDimRentingData AS 
SELECT DISTINCT
[Point_ID] AS [Point_ID],
[City] AS [City],
[Address] AS [Address],
[Postal-code] AS [Postal code]
FROM dbo.RentingTemp
go

MERGE INTO Dim_Renting_Point as TT
	USING vETLDimRentingData as ST
		ON TT.Point_SID = ST.Point_ID
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.[Point_ID],
					ST.[City],
					ST.[Address],
					ST.[Postal Code]
					)
			;

Drop View vETLDimRentingData;
DROP TABLE RentingTemp

SELECT * FROM Dim_Renting_Point