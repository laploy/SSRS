-- Microsoft SQL Server Reporting Services class 2018
-- Loy Vanich (laploy@gmail.com)
-- 0210 Using Stored Procedure

USE AdventureWorks2017;
GO

IF OBJECT_ID('usp_SalesByTerritory') IS NOT NULL
	DROP PROC usp_SalesByTerritory;
GO

CREATE PROC usp_SalesByTerritory @Year INT, @TerritoryID INT AS
	SELECT YEAR(OrderDate) AS OrderYear, C.CustomerID,
	SUM(TotalDue) AS Sales,
	T.TerritoryID, T.Name AS Territory, s.Name AS Store
	FROM sales.SalesOrderHeader AS SOH
		JOIN Sales.SalesTerritory AS T ON SOH.TerritoryID = T.TerritoryID
		JOIN Sales.Customer AS C ON SOH.CustomerID = C.CustomerID
		JOIN Sales.Store AS S ON S.BusinessEntityID = C.StoreID
		WHERE YEAR(OrderDate) = @Year AND T.TerritoryID = @TerritoryID
		GROUP BY C.CustomerID, T.TerritoryID, T.Name,
		YEAR(OrderDate), S.Name;