SELECT 
	c.name as ClientName,
	SUM(pr.price * op.quantity) as TotalSum
FROM clients c
JOIN
	orders ord on c.client_id = ord.client_id
JOIN 
    order_products op ON ord.order_id = op.order_id
JOIN 
    products pr ON op.product_id = pr.product_id
GROUP BY 
    c.client_id, c.name;