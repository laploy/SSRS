-- Microsoft SQL Server Reporting Services Class 2018
-- Loy Vanich (laploy@gmail.com)
-- 0100 Crate first report
SELECT
	SalesLT.Product.ProductID, 
	SalesLT.Product.Name, 
	SalesLT.ProductCategory.Name AS Category, 
	SalesLT.Product.Color, 
	SalesLT.Product.ListPrice
FROM SalesLT.Product 
	INNER JOIN SalesLT.ProductCategory 
		ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID