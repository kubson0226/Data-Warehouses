use KENAP
go

INSERT INTO Dim_Reservation_Info
SELECT C, S
FROM 
	  (
		VALUES 
			  ('Short'),
			  ('Long')
	  ) 
	AS Category(C)
	
	, (
		VALUES 
			  ('S'),
			  ('U')
	  ) 
	AS _Status(S);

	SELECT * FROM
	Dim_Reservation_Info