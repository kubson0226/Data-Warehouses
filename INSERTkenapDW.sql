
INSERT INTO Dim_Price_Table 
VALUES (1, 'L');

INSERT INTO Dim_Price_Table 
VALUES (2, 'M');

INSERT INTO Dim_Price_Table 
VALUES (3, 'H');

INSERT INTO Dim_Car VALUES (1, 'HWDP997', 'Citroen', 2, 'C4', 1964);
INSERT INTO Dim_Car VALUES (2, 'AA42ADF', 'Audi', 1, 'A4', 2000);
INSERT INTO Dim_Car VALUES (3, 'ZXC2351', 'Audi', 1, 'Q3', 2008);
INSERT INTO Dim_Car VALUES (4, 'HGB1345', 'Fiat', 3, 'Panda', 1451);
INSERT INTO Dim_Car VALUES (5, 'NLI7612', 'Citroen', 2, 'C4', 1946);
INSERT INTO Dim_Car VALUES (6, 'PIY8942', 'Mercedes', 1, 'A', 2012);
INSERT INTO Dim_Car VALUES (7, 'MKO1712', 'Skoda', 2, 'Superb', 2006);
INSERT INTO Dim_Car VALUES (8, 'ASN1234', 'Opel', 3, 'Corsa', 1955);
INSERT INTO Dim_Car VALUES (9, 'UHR6527', 'Opel', 1, 'Mokka', 1971);
INSERT INTO Dim_Car VALUES (10, 'PQL1209', 'Dacia', 2, 'Duster', 1961);

INSERT INTO Dim_Renting_Point VALUES (1, 'Bydgoszcz', 'Krótka 100/99', '21-379');
INSERT INTO Dim_Renting_Point VALUES (2, 'Gdañsk', 'D³uga 99/10', '21-678');
INSERT INTO Dim_Renting_Point VALUES (3, 'Sopot', 'Szeroka 1/9', '21-420');
INSERT INTO Dim_Renting_Point VALUES (4, 'Wroc³awek', 'Niska 12/18', '21-240');
INSERT INTO Dim_Renting_Point VALUES (5, 'Sosnowiec', 'Wiksa 97/22', '21-024');
INSERT INTO Dim_Renting_Point VALUES (6, 'Pó³tusk', 'Dobra 240/37', '21-042');
INSERT INTO Dim_Renting_Point VALUES (7, 'Rawka', 'Zla 24/6', '21-204');
INSERT INTO Dim_Renting_Point VALUES (8, 'Wa³brzych', 'Polska 42/1', '21-402');
INSERT INTO Dim_Renting_Point VALUES (9, 'Bia³ystko', 'Polka 69/2', '21-997');
INSERT INTO Dim_Renting_Point VALUES (10, 'S³upsk', 'Pana Boczka 78/4', '21-112');

INSERT INTO Dim_Customer VALUES (1, '75070148996', 'W³adek', 'Ladek', '1997-01-21', 'M', 'Gdansk','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (2, '05232015628', 'Romek', 'Tytus', '1986-02-21', 'M', 'Wroclaw','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (3, '50032831774', 'Tadek', 'Padek', '1959-03-21', 'M', 'Gdansk','Old', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (4, '90091198971', 'Atomek', 'Romek', '1999-04-21', 'M', 'Gdynia','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (5, '96052379496', 'Tytus', 'Pikus', '1996-05-21', 'M', 'Pultusk','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (6, '66010363566', 'Marianek', 'Warianek', '1987-06-21', 'M', 'Kotlina wysoka','Middle-age', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (7, '77092416648', 'Olek', 'Bloczek', '2002-07-21', 'M', 'Wroclaw','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (8, '68021437999', 'Wiktorek', 'Czetorek', '1990-08-21', 'M', 'Katowice','Middle-age', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (9, '05282391891', 'Hubi', 'Bubi', '1991-01-21', 'M', 'Warszawa','Young', '2016-02-26', NULL, 1);
INSERT INTO Dim_Customer VALUES (10, '88041981252', 'Kubus', 'Janik', '1992-10-21', 'M', 'Starogard Gdanski','Young', '2016-02-26', NULL, 1);

INSERT INTO Dim_Reservation_Info VALUES (1, 'Long', 'S');
INSERT INTO Dim_Reservation_Info VALUES (2, 'Long', 'U');
INSERT INTO Dim_Reservation_Info VALUES (3, 'Short', 'S');
INSERT INTO Dim_Reservation_Info VALUES (4, 'Short', 'U');

INSERT INTO Dim_Date VALUES (1, '2018-01-01', 2018, 'January', 1, 1);
INSERT INTO Dim_Date VALUES (2, '2018-01-21', 2018, 'January', 1, 21);
INSERT INTO Dim_Date VALUES (3, '2018-02-21', 2018, 'February', 2, 21);
INSERT INTO Dim_Date VALUES (4, '2018-03-21', 2018, 'March', 3, 21);
INSERT INTO Dim_Date VALUES (5, '2018-04-21', 2018, 'April', 4, 21);
INSERT INTO Dim_Date VALUES (6, '2018-05-21', 2018, 'May', 5, 21);
INSERT INTO Dim_Date VALUES (7, '2018-06-22', 2018, 'June', 6, 21);
INSERT INTO Dim_Date VALUES (8, '2018-07-21', 2018, 'July', 7, 21);
INSERT INTO Dim_Date VALUES (9, '2018-08-21', 2018, 'August', 8, 21);
INSERT INTO Dim_Date VALUES (10, '2018-09-21', 2018, 'September', 9, 21);

INSERT INTO Fact_Reservation VALUES (2, 1, 2, 1, 6, 1, 20, 21, 2115);
INSERT INTO Fact_Reservation VALUES (1, 2, 3, 2, 8, 1, 31, 32, 1156);
INSERT INTO Fact_Reservation VALUES (3, 3, 4, 3, 4, 1, 30, 59, 1790);
INSERT INTO Fact_Reservation VALUES (4, 4, 5, 4, 2, 2, 31, 18, 7890);
INSERT INTO Fact_Reservation VALUES (5, 5, 6, 5, 3, 2, 30, 22, 4325);
INSERT INTO Fact_Reservation VALUES (6, 6, 7, 6, 3, 1, 31, 31, 2781);
INSERT INTO Fact_Reservation VALUES (7, 7, 8, 7, 10, 1, 30, 16, 5132);
INSERT INTO Fact_Reservation VALUES (8, 1, 3, 8, 4, 1, 62, 28, 1999);
INSERT INTO Fact_Reservation VALUES (9, 4, 6, 9, 8, 1, 60, 27, 2244);
INSERT INTO Fact_Reservation VALUES (10, 7, 9, 10, 7, 2, 92, 26, 2400);

SELECT * FROM Dim_Customer;
SELECT * FROM Dim_Car;
SELECT * FROM Fact_Reservation;