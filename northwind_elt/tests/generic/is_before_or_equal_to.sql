{% test is_before_or_equal_to(model, column_name, before_date) %}
    -- This test checks that the ship date comes after or equal to the order date
    WITH shipped AS (
        select * from {{ model }} where shipped_date is not null
    )

    select *
    from shipped
    where {{ before_date }} > {{ column_name }}

{% endtest %}