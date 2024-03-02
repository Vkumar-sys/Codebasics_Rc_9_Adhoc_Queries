--Q4>
/* 
Produce a report that calculates ISU % for each category during the Diwali campaign.Additionaly,
provide rankings for the categories based on their ISU%.Report will include three key fields category,isu%,and rank order.
This information will assist in assessing the category wise success and impact of Diwali campaign on incremental sales
 */

--Query:-

With cte as
(
 select 
      dp.category,
      sum(fe.quantity_sold_pre_promo) as qty_sold_pre_promo,
      sum(fe.adjusted_quantity_sold_after_promo) as qty_sold_after_promo
 from 
 fact_events_new fe 
 inner join 
 dim_products dp 
 on fe.product_code=dp.product_code 
 where fe.campaign_id='CAMP_DIW_01'
 group by dp.category
),
ISU as
(
select
*,
round((qty_sold_after_promo-qty_sold_pre_promo)*1.0/qty_sold_pre_promo*100,2) as ISU
from cte
 )
select 
category,
ISU,
dense_rank() over(order by ISU desc) as rnk 
from ISU; 
