with
    orders as (select * from {{ ref("stg_orders") }}),

    payments as (select * from {{ ref("stg_payments") }}),

    order_payments as (
        select
            order_id,
            sum(case when payment_status = 'success' then amount end) as amount
        from payments
        group by order_id
    )

select
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    coalesce(order_payments.amount, 0) as amount
from orders
left join order_payments using (order_id)
