WITH product AS (
SELECT
	reorder_level,
	category_id,
	units_in_stock,
	units_on_order,
	product_id,
	quantity_per_unit,
	discontinued,
	unit_price,
	supplier_id,
	product_name
FROM
	{{ ref('stg_products') }}
),

category AS (
SELECT
	category_name,
	category_id,
	description
FROM
	{{ ref('stg_categories') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key_hash,
    {{ dbt_utils.generate_surrogate_key(['supplier_id']) }} as supplier_key_hash,
	p.reorder_level,
	p.category_id,
	p.units_in_stock,
	p.units_on_order,
	p.product_id,
	p.quantity_per_unit,
	p.discontinued = 1 AS is_discontinued,
	p.unit_price,
	p.supplier_id,
	p.product_name,
	c.category_name,
	c.description AS category_desc
FROM 
	product p LEFT JOIN category c
	ON p.category_id = c.category_id 
