SELECT
	region_id,
	region_description
FROM {{ source('northwind', 'region') }}