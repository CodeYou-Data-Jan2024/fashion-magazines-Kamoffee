SELECT customers.customer_name AS Customer,
       "$" || PRINTF('%.2f', SUM(subscriptions.subscription_length * subscriptions.price_per_month)) AS "Amount Due"
FROM orders
INNER JOIN customers ON customers.customer_id = orders.customer_id
INNER JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = 'unpaid'
GROUP BY customers.customer_name;
