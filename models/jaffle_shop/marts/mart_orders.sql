with customers as (
    select * from {{ ref('dim_customers')}}
),

orders as (
    select * from {{ ref('fct_orders')}}
)

select
orders.order_id,
orders.order_date,
orders.amount,
customers.first_name,
customers.last_name,
customers.first_order_date,
customers.most_recent_order_date,
customers.number_of_orders,
customers.lifetime_value

from orders
left join customers on orders.customer_id = customers.customer_id
order by orders.order_id asc