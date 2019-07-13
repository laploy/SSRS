CREATE TABLE SalesTotal
 (Id INT PRIMARY KEY IDENTITY(1,1),
Product nvarchar(20),
Amount Float)
 
 
INSERT INTO SalesTotal 
VALUES    ('Apple','20'),('Orange','166'),('Banana','50') ,('Kiwi','10'),('Mango','110')