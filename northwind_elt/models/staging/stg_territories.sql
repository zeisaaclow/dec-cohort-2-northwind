SELECT
	territory_id,
	territory_description,
	region_id
FROM {{ source('northwind', 'territories') }}