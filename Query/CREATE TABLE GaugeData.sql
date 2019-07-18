CREATE TABLE GaugeData
 (Id INT PRIMARY KEY IDENTITY(1,1),
Product nvarchar(20),
Amount1 int,
Amount2 int,
Amount3 int
)
 

INSERT INTO GaugeData 
VALUES    ('Apple','20', '50', '80')