SELECT
	all_clients.id , 
	ANY_VALUE(all_clients.name), 
        all_orders.item_id, 
        SUM(all_orders.amount_of_items) AS total_items_ordered
FROM clients AS all_clients
INNER JOIN orders AS all_orders 
	ON all_clients.id = all_orders.client_id
WHERE all_orders.order_date >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '5 month'
	AND all_orders.order_date < DATE_TRUNC('month', CURRENT_DATE)
GROUP BY all_clients.id, 
        all_orders.item_id
HAVING SUM(all_orders.amount_of_items) > 30
ORDER BY all_clients.id;
