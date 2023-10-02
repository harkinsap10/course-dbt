{%- macro product_name(table_name, column_name) -%}

{%-
    set product_name = dbt_utils.get_column_values(
        table = ref('int_orders_with_products')
        ,column = 'product_name'
    )
-%}

{%- for product_name in product_name %}
, sum(case when product_name = '{{ product_name }}' then quantity else 0 end)
        as {{product_name}}
{%- endfor %}

{%- endmacro %}