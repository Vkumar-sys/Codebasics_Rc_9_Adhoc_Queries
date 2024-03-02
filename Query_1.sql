--Q1>
/* Provide list of products with base price greater than 500 and that are featured in promo_type BOGOF
   This information will help us identify high-value products that are currently being heavily discouted,which can be useful for evaluating 
   pricing and promotion strategies
*/

--Query:-
select distinct
      dp.product_code,
      dp.product_name
 from 
    fact_events fe inner join dim_products dp
    on 
	fe.product_code=dp.product_code 
where 
fe.base_price>500 
   and 
fe.promo_type='BOGOF';

