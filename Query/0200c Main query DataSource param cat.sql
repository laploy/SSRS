-- Microsoft SQL Server Reporting Services class 2018
-- Loy Vanich (laploy@gmail.com)
-- 0200 Main query DataSource param cat
SELECT
	soh.OrderDate AS [Date],
	soh.SalesOrderNumber AS [Order],
	pps.Name AS Subcat, pp.Name as Product,
	SUM(sd.OrderQty) AS Qty,
	SUM(sd.LineTotal) AS LineTotal
FROM Sales.SalesPerson sp
	INNER JOIN Sales.SalesOrderHeader AS soh
		ON sp.BusinessEntityID = soh.SalesPersonID
	INNER JOIN Sales.SalesOrderDetail AS sd
		ON sd.SalesOrderID = soh.SalesOrderID
	INNER JOIN Production.Product AS pp
		ON sd.ProductID = pp.ProductID
	INNER JOIN Production.ProductSubcategory AS pps
		ON pp.ProductSubcategoryID = pps.ProductSubcategoryID
	INNER JOIN Production.ProductCategory AS ppc
		ON ppc.ProductCategoryID = pps.ProductCategoryID
WHERE pps.Name IN (@SubCat)
	GROUP BY ppc.Name, soh.OrderDate, soh.SalesOrderNumber, pps.Name, pp.Name,
	soh.SalesPersonID
HAVING ppc.Name = 'Clothing'
AND (soh.OrderDate BETWEEN '2014-01-01' AND '2014-03-31')
