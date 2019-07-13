SELECT * , 
	CASE 
		WHEN KpiTarget > 	 Amount THEN -1 
		WHEN 	KpiTarget <	 Amount THEN 1
	ELSE
		0
	END AS Sts	
FROM 
	(
		SELECT * , 
		(SELECT AVG(Sl.Amount)*1.1 FROM Sales3Years Sl) as KpiTarget
			FROM Sales3Years	
	) as tmp_tbl
	order by SaleYear ASC