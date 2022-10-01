--I want to find out the top 3 car manufacturers that customers bought 
-- by sales (quantity) and the sales number for it in the current month.

with top_3_manufacturers as(
  select 
    b.manufacturer_id, 
    count(distinct a.order_id) as sales_quantity 
  from 
    public.sales as a 
    left join public.cars as b on a.serial_number = b.serial_number 
  group by 
    b.manufacturer_id 
  order by 
    2 desc 
  limit 
    3
), 
current_month_quantity as (
  select 
    t2.manufacturer_id, 
    count(distinct t1.order_id) as sales_quantity 
  from 
    public.sales as t1 
    left join public.cars as t2 on t1.serial_number = t2.serial_number 
  where 
    t2.manufacturer_id in (
      select 
        manufacturer_id 
      from 
        top_3_manufacturers
    ) 
    and t1.order_date >= date_trunc('month', CURRENT_DATE) 
  group by 
    t2.manufacturer_id
) 
select 
  a.manufacturer_id, 
  b.manufacturer_name, 
  a.sales_quantity 
from 
  current_month_quantity as a 
  left join public.manufacturer as b on a.manufacturer_id = b.manufacturer_id 
order by 
  a.sales_quantity desc;
