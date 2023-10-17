WITH customers AS (
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
FROM
	{{ ref('stg_customers') }}
),

customer_customer_demo AS (
SELECT 
	customer_id,
	customer_type_id
FROM
	{{ ref('stg_customer_customer_demo') }}
),

customer_demographics AS (
SELECT
	customer_desc, 
	customer_type_id 
FROM
	{{ ref('stg_customer_demographics') }}
)

SELECT 
	{{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} as customer_key_hash,
	c.country,
	c.contact_name,
	c.address,
	c.city,
	c.phone,
	c.company_name,
	c.fax,
	c.region,
	c.customer_id,
	c.postal_code,
	c.contact_title,
	cd.customer_desc 
FROM customers c 
LEFT JOIN customer_customer_demo ccd ON c.customer_id  = ccd.customer_id 
LEFT JOIN customer_demographics cd ON ccd.customer_type_id  = cd.customer_type_id 