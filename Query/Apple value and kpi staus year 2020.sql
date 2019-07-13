SELECT id, Product, Saleyear,
	Amount as Value, Goal,
	CASE 
		WHEN Goal > Amount THEN -1 
		WHEN Goal < Amount THEN 1
	ELSE
		0
	END AS Status	
FROM 
	(
		SELECT * , 
		(SELECT AVG(Sl.Amount)*1.1 
			FROM Sales3Years Sl) as Goal
		FROM Sales3Years	
	) as tmp_tbl
WHERE Product = 'Apple' and SaleYear = 2020
order by SaleYear ASC