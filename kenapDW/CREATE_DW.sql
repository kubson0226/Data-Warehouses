use KENAP
go

CREATE TABLE Dim_Price_Table
(Type_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
_Type VARCHAR(1))

CREATE TABLE Dim_Car
(Car_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
License_Plate VARCHAR(7),
Brand VARCHAR(30),
Type_sid INT FOREIGN KEY REFERENCES Dim_Price_Table(Type_SID),
Model VARCHAR(30),
Prod_Year INT
)

CREATE TABLE Dim_Renting_Point(
Point_SID TINYINT NOT NULL PRIMARY KEY,
City VARCHAR(30),
_Address VARCHAR(40),
Postal_Code VARCHAR(6)
)

CREATE TABLE Dim_Customer(
Customer_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
PESEL VARCHAR(11),
_Name VARCHAR(30),
Surname VARCHAR(30),
Date_of_birth DATE,
Gender VARCHAR(1),
City VARCHAR(30),
Age_Category VARCHAR(20),
Activation_Date DATE,
Disactivation_Date DATE,
Is_Active BIT
)

CREATE TABLE Dim_Reservation_Info(
Category_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
Reserv_category VARCHAR(6),
_Status VARCHAR(1)
)

CREATE TABLE Dim_Date(
Date_SID INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
_Date DATE,
_Year INT,
_Month VARCHAR(10),
MonthNo INT,
_Day INT
)

CREATE TABLE Fact_Reservation(
Car_sid INT FOREIGN KEY REFERENCES Dim_Car(Car_SID),
Date_from INT FOREIGN KEY REFERENCES Dim_Date(Date_SID),
Date_to INT FOREIGN KEY REFERENCES Dim_Date(Date_SID),
Customer_sid INT FOREIGN KEY REFERENCES Dim_Customer(Customer_SID),
Point_sid TINYINT FOREIGN KEY REFERENCES Dim_Renting_Point(Point_SID),
Category_sid INT FOREIGN KEY REFERENCES Dim_Reservation_Info(Category_SID),
Time_of_reservation INT,
Customer_Age INT,
Profit INT
PRIMARY KEY(Car_sid, Date_from, Date_to, Customer_sid, Point_sid, Category_sid)
)
