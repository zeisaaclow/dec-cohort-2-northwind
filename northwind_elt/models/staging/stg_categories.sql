SELECT
	category_name,
	description,
	category_id
FROM {{ source('northwind', 'categories') }}