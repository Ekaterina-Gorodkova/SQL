SELECT 
        all_clients.id, 
        ANY_VALUE(all_clients.name),
        SUM(all_orders.amount_of_items) AS total_items_ordered
FROM clients as all_clients
INNER JOIN orders AS all_orders 
        ON all_clients.id = all_orders.client_id
WHERE all_orders.order_date >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '5 month'
        AND all_orders.order_date < DATE_TRUNC('month', CURRENT_DATE)
GROUP BY all_clients.id
ORDER BY total_items_ordered DESC, 
        all_clients.id ASC
LIMIT 5;
