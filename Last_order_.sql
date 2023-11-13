WITH DateOrders AS (
    SELECT client_id, order_date,
        LEAD(order_date) OVER (PARTITION BY client_id ORDER BY order_date) AS next_order_date
  
    FROM orders
)
SELECT DISTINCT client_id, MAX(order_date) AS last_order_date,
                MAX(next_order_date) AS previous_order_date

FROM DateOrders As date_of_order
GROUP BY client_id
ORDER BY client_id;
