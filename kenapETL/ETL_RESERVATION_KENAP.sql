use KENAP
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
    FROM 'C:\Kuba_pliki\Studia\Sem 4\Data Warehouses\DataWarehouses-main_KENAP\Bulks\customer.csv'
    WITH
    (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

IF(OBJECT_ID('vETLReservationData') is not NULL) DROP View vETLReservationData;
go

CREATE VIEW vETLReservationData AS
SELECT
Time_of_reservation,
Customer_Age,
Profit,
Car_sid,
Date_from,
Date_to,
Customer_sid,
Point_sid,
Category_sid
FROM (SELECT
Time_of_reservation = DATEDIFF(Day, R.Date_From, R.Date_To) + 1,
Customer_Age = DATEDIFF(YEAR, CT.Date_of_birth, R.Date_To),
Profit = (DATEDIFF(Day, R.Date_From, R.Date_To) + 1) * P.Price_per_day,
Car_sid = DC.Car_SID,
Date_from = DF.Date_SID,
Date_To = DT.Date_SID,
Customer_sid = Customer.Customer_SID,
Point_sid = CO.Point_id,
CASE
	WHEN [Status] = 1 AND DATEDIFF(Day, R.Date_From, R.Date_To) <= 1 THEN 1
	WHEN [Status] = 0 AND DATEDIFF(Day, R.Date_From, R.Date_To) <= 1 THEN 2
	WHEN [Status] = 1 AND DATEDIFF(Day, R.Date_From, R.Date_To) >= 1 THEN 3
	WHEN [Status] = 0 AND DATEDIFF(Day, R.Date_From, R.Date_To) >= 1 THEN 4
	ELSE -1
END AS [Category_sid]
FROM KENAP_DB.dbo.Reservation AS R
JOIN CustomerTemp AS CT ON CT.PESEL = R.Customer_Pesel
JOIN KENAP_DB.dbo.Car_Occupancy AS CO ON CO.Occupancy_ID = R.Occupancy_id
JOIN KENAP_DB.dbo.Car AS Car ON CO.Licence_plate = Car.License_Plate
JOIN KENAP_DB.dbo.Price_Table AS P ON P.[Type] = Car.Car_Type
JOIN Dim_Car AS DC ON DC.License_Plate = CO.Licence_plate
JOIN Dim_Date AS DF ON DF._Date = R.Date_From
JOIN Dim_Date AS DT ON DT._Date = R.Date_To
JOIN Dim_Customer AS Customer ON Customer.PESEL = R.Customer_Pesel AND R.Date_From BETWEEN Customer.Activation_Date AND ISNULL(Customer.Disactivation_Date, CURRENT_TIMESTAMP)) AS x
GO

SELECT * FROM vETLReservationData

MERGE INTO Fact_Reservation as TT
	USING vETLReservationData as ST
		ON 	
			TT.Car_sid = ST.Car_sid
		AND TT.Date_from = ST.Date_from
		AND TT.Date_to = ST.Date_to
		AND TT.Customer_sid = ST.Customer_sid
		AND TT.Point_sid = ST.Point_sid
		AND TT.Category_sid = ST.Category_sid
			WHEN Not Matched
				THEN
					INSERT
					Values (
						  ST.Car_sid
						, ST.Date_from
						, ST.Date_to
						, ST.Customer_sid
						, ST.Point_sid
						, ST.Category_sid
						, ST.Time_of_reservation
						, ST.Customer_Age
						, ST.Profit
					)
			;

Drop view vETLReservationData;
---DELETE Fact_Reservation

SELECT * FROM Fact_Reservation