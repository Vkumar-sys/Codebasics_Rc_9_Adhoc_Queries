--Q5>
/* Create a report featuring top 5 products,ranked by incremental Revenue Percentage,
   across all campaigns.The report will provide essential information
   including product name,category and IR%.This analysis helps identify the most successful products in terms of incremental revenue
   across our campaigns,assisting in product optimization.
*/

--Query:-

With cte as
(
select 
    dp.product_name,
    dp.category,
    f.quantity_sold_pre_promo*base_price as revenue_before_promo,
    f.adjusted_quantity_sold_after_promo*promo_price as revenue_after_promo
 from
      fact_events_new f
      inner join 
      dim_products dp on  
 f.product_code=dp.product_code
)

,IR_cte as 
(
 select *,(revenue_after_promo-revenue_before_promo)*1.0/(revenue_before_promo)*100 as IR from cte
)

 select * from 
(
   select irc.product_name,irc.category,irc.IR,dense_rank() over(order by IR desc) as drnk from IR_cte irc
)
 xx 
 where
 xx.drnk<=5;

