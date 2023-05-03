BULK INSERT Customer FROM 'C:\Kuba_pliki\Studia\Python\pesel.bulk'
BULK INSERT Renting_Point FROM 'C:\Kuba_pliki\Studia\Python\rentingpoint.bulk'
BULK INSERT Car FROM 'C:\Kuba_pliki\Studia\Python\car_data.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT Employee FROM 'C:\Kuba_pliki\Studia\Python\employee_data.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT Car_Occupancy FROM 'C:\Kuba_pliki\Studia\Python\caroccupancy_data.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT Reservation FROM 'C:\Kuba_pliki\Studia\Python\reservation_data.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT Reservation FROM 'C:\Kuba_pliki\Studia\Python\reservation_data2.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT Car_Occupancy FROM 'C:\Kuba_pliki\Studia\Python\caroccupancy_data2.bulk' WITH (FIELDTERMINATOR='|')

INSERT INTO Price_Table VALUES('L', 100)
INSERT INTO Price_Table VALUES('M', 150)
INSERT INTO Price_Table VALUES('H', 200)
