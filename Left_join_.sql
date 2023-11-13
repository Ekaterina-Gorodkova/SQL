SELECT all_clients.id AS client_id, 
	   ANY_VALUE(all_clients.name) AS client_name, 
       MAX(all_orders.order_date) AS last_order_date
FROM clients AS all_clients
LEFT JOIN orders as all_orders ON all_clients.id = all_orders.client_id
GROUP BY all_clients.id
ORDER BY all_clients.id;