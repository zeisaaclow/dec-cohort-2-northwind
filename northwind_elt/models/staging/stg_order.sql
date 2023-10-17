SELECT
	ship_city, 
	ship_postal_code, 
	required_date, 
	freight, 
	ship_region, 
	order_date, 
	employee_id::VARCHAR, 
	shipped_date, 
	ship_via::VARCHAR, 
	customer_id,
	ship_address, 
	order_id::VARCHAR, 
	ship_name, 
	ship_country
FROM {{ source('northwind', 'orders') }}