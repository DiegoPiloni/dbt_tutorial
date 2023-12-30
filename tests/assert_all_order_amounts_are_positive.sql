with payments as (select * from {{ ref("stg_payments") }})

select order_id, sum(amount) as order_amount
from payments
group by order_id
having order_amount < 0
