CREATE TABLE Sales3years
 (Id INT PRIMARY KEY IDENTITY(1,1),
Product nvarchar(20),
SaleYear int,
Amount Float)
 
 
INSERT INTO Sales3years
VALUES    
	('Apple','2018','20'),('Orange','2018','166'),('Banana','2018','50') ,('Kiwi','2018','10'),('Mango','2018','110'),
	('Apple','2019','10'),('Orange','2019','110'),('Banana','2019','30') ,('Kiwi','2019','15'),('Mango','2019','150'),
	('Apple','2020','90'),('Orange','2020','66'),('Banana','2020','80') ,('Kiwi','2020','10'),('Mango','2020','30')