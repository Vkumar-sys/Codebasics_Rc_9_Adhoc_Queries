--Q3> 
 /* 
   Generate a report that displays each campaign alongwith total revenue generated before and after the 
   campaign this report includes threekey fields campaign_name,total_revenue(before_promotion),total_revenue(after_promotion)
 */

--Query:-

 select 
 campaign_id,
 cast(round(sum(fen.base_price*fen.quantity_sold_pre_promo)*1.0/1000000,0) as varchar)+'M' as total_revenue_before_promo,
 cast(round(sum(fen.promo_price*fen.adjusted_quantity_sold_after_promo)*1.0/1000000,0) as varchar) +'M' as total_revenue_after_promo
 from 
 fact_events_new as fen
 group by 
 campaign_id;
