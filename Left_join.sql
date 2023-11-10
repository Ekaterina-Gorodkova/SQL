SELECT clients.id AS client_id, clients.name, MAX(orders.order_date) AS last_order_date
FROM clients 
LEFT JOIN orders ON clients.id = orders.client_id
GROUP BY clients.id, clients.name
ORDER BY clients.id 