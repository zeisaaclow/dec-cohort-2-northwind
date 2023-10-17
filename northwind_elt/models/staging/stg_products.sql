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
FROM {{ source('northwind', 'products') }}