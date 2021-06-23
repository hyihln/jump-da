SELECT
    [ DISTINCT ]
    	column [, column ] ...
    [FROM table1]
	[ [JOIN | LEFT JOIN | RIGHT JOIN] table2
		ON table2.field = table2.field ]
    [WHERE where_condition]
    [GROUP BY ]
    [HAVING where_condition]
    [ORDER BY 
      [ASC | DESC] ]
    [FETCH ... OFFSET ]