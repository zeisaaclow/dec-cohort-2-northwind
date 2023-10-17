WITH employee AS (
	SELECT 
		country,
		home_phone,
		"extension",
		notes,
		address,
		title_of_courtesy,
		city,
		birth_date,
		last_name,
		hire_date,
		title,
		reports_to,
		employee_id,
		region,
		postal_code,
		first_name
	FROM  {{ ref('stg_employees') }}
)

, employee_territories AS (
SELECT
	employee_id,
	territory_id
FROM
	{{ ref('stg_employee_territories') }}

)

, territories AS (
	SELECT 
		region_id, 
		territory_description, 
		territory_id
	FROM {{ ref('stg_territories') }}
)
, region AS (
	SELECT 
		region_id, 
		region_description 
	FROM {{ ref('stg_region') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['e.employee_id']) }} as employee_key_hash,
	e.country,
	e.home_phone,
	e.extension,
	e.notes,
	e.address,
	e.title_of_courtesy,
	e.city,
	e.birth_date,
	e.last_name,
	e.hire_date,
	e.title,
	e.reports_to,
	et.employee_id,
	et.territory_id,
	e.region,
	e.postal_code,
	e.first_name,
	t.region_id, 
	t.territory_description, 
	r.region_description 
FROM employees e
LEFT JOIN employee_territories et ON e.employee_id  = et.employee_id 
LEFT JOIN territories t ON et.territory_id = t.territory_id 
LEFT JOIN region r ON t.region_id = r.region_id