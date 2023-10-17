SELECT
    country,
	contact_name,
	address,
	city,
	phone,
	company_name,
	fax,
	region,
	customer_id,
	postal_code,
	contact_title
FROM {{ source('northwind', 'customers') }}