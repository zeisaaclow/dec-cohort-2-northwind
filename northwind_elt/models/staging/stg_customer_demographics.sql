SELECT
	customer_desc, 
	customer_type_id 
FROM
	{{ source('northwind', 'customer_demographics') }}