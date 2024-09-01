/* Verifying that I have imported the right number of rows into Dbeacer */
select count(1) from Revenues r 


/* Displaying a subset of the data to explore */
select 
	*
from 
	Revenues r 
limit 30

/* Getting the total revenue and average revenue per platform */
select 
	platform
	,round(sum("Revenue, $")) as total_revenue
	,round(avg("Revenue, $")) as avg_revenue
from
	Revenues r 
group by
	platform 
	
/* Getting the total revenue and average revenue per platform and fiscal quarter */
select 
	platform
	,fiscalYear 
	,round(sum("Revenue, $")) as total_revenue
	,round(avg("Revenue, $")) as avg_revenue
from
	Revenues r 
group by
	platform 
	,fiscalYear 
	
/* Getting the total revenue and average revenue per platform, region level 1 and region level 2 ordered by average descending*/
select
	platform
	,Region_Level_1__c 
	,Region_Level_2__c
	,round(sum("Revenue, $")) as total_revenue
	,round(avg("Revenue, $")) as avg_revenue
from
	Revenues r 
group by
	platform
	,Region_Level_1__c
	,Region_Level_2__c 
order by 
	5 desc

/* Getting the total revenue and average revenue per platform and skutype ordered by average descending*/
select 
	platform
	,skuType
	,round(sum("Revenue, $")) as total_revenue
	,round(avg("Revenue, $")) as avg_revenue
from
	Revenues r 
group by
	platform
	,skuType
order by 
	4 desc

/* Getting the total revenue, usage and averages per region level 1 and region level 2 ordered by average revenue descending*/
select 
	Region_Level_1__c
	,Region_Level_2__c 
	,round(sum("Revenue, $")) as total_revenue
	,round(avg("Revenue, $")) as avg_revenue
	,round(sum("Usage, DBUs")) as total_usage
	,round(avg("Usage, DBUs")) as avg_usage
from
	Revenues r 
group by
	Region_Level_1__c
	,Region_Level_2__c 
order by 
	4 desc

	
/* 
 * Churn rates across the dataset
 */
	
select
	fiscalYear
	,round(cast(sum(churned_quarter) as float) / (count(accountId)) * 100,2) as churn_percentage
from 
	Revenues r 
group by 
	fiscalYear 


/* Exploring recent (most recent fiscal year) churn and new account pattern */
select 
	fiscalQuarter 
	,sum(churned_quarter) as total_churned
	,round(cast(sum(churned_quarter) as float) / (count(accountId)) * 100,2) as churn_percentage
	,sum(new_in_quarter) as total_new
	,round(cast(sum(new_in_quarter) as float) / (count(accountId)) * 100,2) as new_account_percentage
from
	Revenues r 
where 
	fiscalYear = (select max(fiscalYear) from Revenues r2 )
group by
	fiscalQuarter 

	
	
	
/* Exploring the usage by platform over time */
with cte_usage as (
	select
		date(datevalue,  'start of month') as month_usage
		,platform 
		,round(sum("Usage, DBUs")) as platform_usage	
	from 
		Revenues r 
	group by 1,2
)
select 
	month_usage
	,platform
	,platform_usage
	,round(sum(platform_usage) over (partition by month_usage)) as total_month_usage
	,round(sum(platform_usage) over (partition by month_usage, platform) / sum(platform_usage) over (partition by month_usage) * 100) as percentage_usage
from 
	cte_usage
order by 
	month_usage

	
/* Exploring the usage and revenue by platform over time */

with cte_usage_rev as (
	select
		date(datevalue,  'start of month') as month_usage
		,platform 
		,round(sum("Usage, DBUs")) as platform_usage
		,round(sum("Revenue, $")) as platform_revenue
	from 
		Revenues r 
	group by 1,2
)
select 
	month_usage
	,platform
	,platform_usage
	,round(sum(platform_usage) over (partition by month_usage)) as total_month_usage
	,round(sum(platform_usage) over (partition by month_usage, platform) / sum(platform_usage) over (partition by month_usage) * 100) as percentage_usage
	,round(sum(platform_revenue) over (partition by month_usage)) as total_month_revenue
	,round(sum(platform_revenue) over (partition by month_usage, platform) / sum(platform_revenue) over (partition by month_usage) * 100) as percentage_revenue
from 
	cte_usage_rev
order by 
	month_usage

	
