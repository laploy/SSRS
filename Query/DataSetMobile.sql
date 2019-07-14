SELECT id, Product, Saleyear, 
	Amount as Value,
	Goal,
	CASE 
		WHEN Goal > Amount THEN -1 
		WHEN Goal < Amount THEN 1
	ELSE
		0
	END AS Status
FROM 
	(
		SELECT * , 
		(SELECT AVG(Sl.Amount)*1.1 FROM Sales3years Sl) as Goal
			FROM Sales3years	
	) as tmp_tbl
	order by SaleYear ASC