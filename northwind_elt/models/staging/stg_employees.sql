SELECT
	employee_id,
	first_name,
	last_name,
	title,
	country,
	home_phone,
	extension,
	notes,
	address,
	title_of_courtesy,
	city,
	birth_date,
	hire_date,
	reports_to,
	region,
	postal_code
FROM {{ source('northwind', 'employees') }}