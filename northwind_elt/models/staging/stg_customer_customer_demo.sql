SELECT 
	customer_id,
	customer_type_id
FROM
	{{ source('northwind', 'customer_customer_demo') }}