SELECT
	employee_id,
	territory_id
FROM {{ source('northwind', 'employee_territories') }}