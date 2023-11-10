SELECT clients.id , clients.name, orders.item_id, SUM(orders.amount_of_items) AS total_items_ordered
FROM clients 
JOIN orders  ON clients.id = orders.client_id
WHERE orders.order_date >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '5 month'
     AND orders.order_date < DATE_TRUNC('month', CURRENT_DATE)
GROUP BY clients.id, clients.name, orders.item_id
HAVING SUM(orders.amount_of_items) > 30
ORDER BY clients.id;