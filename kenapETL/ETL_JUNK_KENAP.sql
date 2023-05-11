use KENAP
go

Delete Dim_Reservation_Info
INSERT INTO Dim_Reservation_Info Values (1, 'Short','S')
INSERT INTO Dim_Reservation_Info Values (2, 'Short','U')
INSERT INTO Dim_Reservation_Info Values (3, 'Long','S')
INSERT INTO Dim_Reservation_Info Values (4, 'Long','U')
INSERT INTO Dim_Reservation_Info Values(-1, '', '');
go

	SELECT * FROM
	Dim_Reservation_Info
