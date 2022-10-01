--I want to know the list of our customers and their spending.
with spending_by_customers as (
  select 
    customer_id, 
    sum(transaction_price) as total_amount_spent, 
    count(distinct order_id) as num_of_purchases 
  from 
    public.sales 
  group by 
    customer_id
) 
select 
  a.customer_id, 
  b.customer_name, 
  b.customer_phone, 
  a.total_amount_spent, 
  a.num_of_purchases 
from 
  spending_by_customers as a 
  left join public.customers as b on a.customer_id = b.customer_id 
order by 
  a.total_amount_spent desc, 
  a.num_of_purchases desc;