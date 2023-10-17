SELECT
	quantity,
	product_id::VARCHAR,
	discount,
	unit_price,
	order_id::VARCHAR
FROM {{ source('northwind', 'order_details') }}