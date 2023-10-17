with orders as (
    select
    	order_id, 
		customer_id,
		employee_id,
		required_date,
		shipped_date,
		freight,
		ship_country,
		order_date
    FROM {{ ref('stg_order') }}
), 

order_detail AS (
	SELECT 
		order_id,
		product_id,
		unit_price,
		quantity,
		discount
	FROM {{ ref('stg_order_detail') }}
)

select 	
    {{ dbt_utils.generate_surrogate_key(['order_detail.order_id', 'order_detail.product_id']) }} as order_item_key_hash,
    {{ dbt_utils.generate_surrogate_key(['order_detail.product_id']) }} as product_key_hash,
    {{ dbt_utils.generate_surrogate_key(['orders.customer_id']) }} as customer_key_hash,
    {{ dbt_utils.generate_surrogate_key(['orders.employee_id']) }} as employee_key_hash,
    {{ dbt_utils.generate_surrogate_key(['orders.order_date']) }} as order_date_key_hash,
	orders.customer_id,
	orders.employee_id,
    orders.required_date,
	orders.shipped_date,
	orders.freight,
	orders.order_date,
	order_detail.order_id, 
	order_detail.product_id, 
	order_detail.quantity, 
	order_detail.discount, 
	order_detail.unit_price
from order_detail
left join orders 
	on order_detail.order_id = orders.order_id