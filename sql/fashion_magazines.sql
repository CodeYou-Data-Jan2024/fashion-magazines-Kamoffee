SELECT customers.customer_name,
       subscriptions.price_per_month,
       subscriptions.subscription_length,
       (subscriptions.subscription_length * subscriptions.price_per_month) AS Amount_Due
FROM orders
INNER JOIN customers ON customers.customer_id = orders.customer_id
INNER JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE order_status = 'unpaid'
GROUP BY customer_name;
