{# {% snapshot snp_scrapreason %}

{{
    config(
        target_schema='serving',
        target_database='northwind_dw'
        unique_key='employee_id',
        strategy='check'
        check_cols='All'
    )
}}

select * from {{ source('northwind', 'employees')}}

{% endsnapshot %} #}