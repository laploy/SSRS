SELECT 
   SOH.SalesPersonID AS ID, P.FirstName, P.LastName,
   SOH.SalesOrderNumber AS [Order], 
   SOH.OrderDate AS [Date], 
   DATEPART(yy, SOH.OrderDate) AS [Year], 
   DATEPART(mm, SOH.OrderDate) AS [Month],
   ST.[Group] AS [Geography],  
   ST.CountryRegionCode AS CountryRegion, 
   ST.Name AS Territory, 
   PPC.Name AS Category, PPS.Name AS Subcat, PP.Name AS Product,
   PP.Color, PP.Size, 
   CASE
      WHEN PP.Size = 'S' THEN 1
      WHEN PP.Size = 'M' THEN 2
      WHEN PP.Size = 'L' THEN 3
      WHEN PP.Size = 'XL' THEN 4
      ELSE PP.Size
   END AS SizeSortOrder,  
   SUM(SD.OrderQty) AS Qty,
   SUM(SD.LineTotal) AS LineTotal
FROM Sales.SalesPerson AS SP 
   INNER JOIN Sales.SalesOrderHeader AS SOH
      ON SP.BusinessEntityID = SOH.SalesPersonID
   INNER JOIN Person.Person AS P 
      ON P.BusinessEntityID = SP.BusinessEntityID
   INNER JOIN Sales.SalesOrderDetail AS SD 
      ON SD.SalesOrderID = SOH.SalesOrderID
   INNER JOIN Production.Product AS PP 
      ON SD.ProductID = PP.ProductID
   INNER JOIN Sales.SalesTerritory AS ST 
      ON ST.TerritoryID = SP.TerritoryID
   INNER JOIN Production.ProductSubcategory AS PPS 
      ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
   INNER JOIN Production.ProductCategory AS PPC
      ON PPC.ProductCategoryID = PPS.ProductCategoryID
GROUP BY PPC.Name, SOH.OrderDate, SOH.SalesOrderNumber, 
   PPS.Name, PP.Name, 
   SOH.SalesPersonID, P.LastName, P.FirstName,
   ST.[Group], ST.CountryRegionCode, ST.Name,
   PP.Color, PP.Size
HAVING (DATEPART(yy,SOH.OrderDate) IN ('2011','2012') 
   AND ST.[Group] = 'North America'
   --AND LEFT(PPS.Name,1) IN ('C','T')
   --AND LEFT(PPC.Name,1) = 'C'
   )