
--Q2> /* Generate a report that provides an overview of the number of stores in each cityThe results will be sorted in descending order of store counts helping us to identify the cities with highest store presence.Report includes two esential fields city and store count which will be assist in optimizing retail operations.
	  */

--Query:-

select 
ds.city,count(distinct store_id) as store_count
from dim_Stores ds 
group by ds.city 
order by store_count desc;