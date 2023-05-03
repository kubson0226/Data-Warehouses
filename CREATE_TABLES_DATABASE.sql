CREATE TABLE [Price_Table] (
  [Type] varchar(1) PRIMARY KEY,
  [Price_per_day] tinyint,
)
GO

CREATE TABLE [Car] (
  [License_Plate] varchar(7) PRIMARY KEY,
  [Brand] varchar(30),
  [Model] varchar(30),
  [Prod_year] date,
  [Car_Type] varchar(1)
)
GO

CREATE TABLE [Car_Occupancy] (
  [Occupancy_ID] int PRIMARY KEY,
  [Date_From] date,
  [Date_To] date,
  [Licence_plate] varchar(7),
  [Point_id] tinyint
)
GO

CREATE TABLE [Renting_Point] (
  [Point_ID] tinyint PRIMARY KEY
)
GO

CREATE TABLE [Reservation] (
  [Reservation_ID] int PRIMARY KEY,
  [Date_From] date,
  [Date_To] date,
  [Time_of_occupancy] int,
  [Status] bit,
  [Customer_Pesel] char(11),
  [Employee_id] char(6),
  [Occupancy_id] int
)
GO

CREATE TABLE [Customer] (
  [PESEL] char(11) PRIMARY KEY
)
GO

CREATE TABLE [Employee] (
  [Employee_ID] char(6) PRIMARY KEY,
  [Name] varchar(20),
  [Surname] varchar(20),
  [Phone_number] char(9),
  [Renting_point_id] tinyint
)
GO

ALTER TABLE [Reservation] ADD FOREIGN KEY ([Customer_Pesel]) REFERENCES [Customer] ([PESEL])
GO

ALTER TABLE [Reservation] ADD FOREIGN KEY ([Employee_id]) REFERENCES [Employee] ([Employee_ID])
GO

ALTER TABLE [Employee] ADD FOREIGN KEY ([Renting_point_id]) REFERENCES [Renting_Point] ([Point_ID])
GO

ALTER TABLE [Car] ADD FOREIGN KEY ([Car_Type]) REFERENCES [Price_Table] ([Type])
GO

ALTER TABLE [Car_Occupancy] ADD FOREIGN KEY ([Licence_plate]) REFERENCES [Car] ([License_Plate])
GO

ALTER TABLE [Car_Occupancy] ADD FOREIGN KEY ([Point_id]) REFERENCES [Renting_Point] ([Point_ID])
GO

ALTER TABLE [Reservation] ADD FOREIGN KEY ([Occupancy_id]) REFERENCES [Car_Occupancy] ([Occupancy_ID])
GO
