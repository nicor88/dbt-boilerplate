{{
  config(
    materialized='table',
    schema='dwh',
    tags=['dwh', 'fact']
  )
}}

{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select * from {{ ref('stg_orders') }}

),

order_payments as (

    select * from {{ ref('order_payments') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,

        {% for payment_method in payment_methods -%}

        order_payments.{{payment_method}}_amount,

        {% endfor -%}

        order_payments.total_amount as amount

    from orders

    left join order_payments using (order_id)

)

select
    *,
    -- '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' AS populated_at,
    '{{ run_started_at.astimezone(modules.pytz.timezone("UTC")).strftime("%Y-%m-%d %H:%M:%S") }}'::TIMESTAMP AS populated_at
from final
