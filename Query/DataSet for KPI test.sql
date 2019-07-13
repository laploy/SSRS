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
		(SELECT AVG(Sl.Amount)*1.1 FROM SalesPerYear Sl) as KpiTarget
			FROM SalesPerYear	
	) as tmp_tbl
	order by SalesYear ASC