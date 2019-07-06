/* Microsoft SQL Server Reporting Services class
 Loy Vanich (laploy@gmail.com)
 0200 Report Param DataSourcePamramCat*/
SELECT sub.Name
FROM Production.ProductCategory AS cat 
	INNER JOIN Production.ProductSubcategory AS sub 
		ON cat.ProductCategoryID = sub.ProductCategoryID
WHERE (cat.Name = 'Clothing')
ORDER BY sub.Name
