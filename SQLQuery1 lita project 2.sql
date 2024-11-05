CREATE DATABASE LITA_CAPSTONE_PROJECT_2
SELECT * FROM [dbo].[CustomerData$]

....... retrieve the total number of customers from each region ......

SELECT COUNT(*) AS TOTAL_CUSTOMERS,
Region
from
[dbo].[CustomerData$]
where
Region in ('North', 'West', 'East', 'South')
group by
Region

.........find the most popular subscription type by the number of customers.......
select
SubscriptionType,
count(*) as Total_customers
from [dbo].[CustomerData$]
group by
SubscriptionType
order by
Total_customers Desc 

SELECT * FROM [dbo].[CustomerData$]


.......find customers who canceled their subscription within 6 months......
SELECT 
CustomerID
from
[dbo].[CustomerData$]
where
datediff (Canceled,SubscriptionStart,SubcriptionEnd) <= 365

.........calculate the average subscription duration for all customers.......

select
avg(datediff(SubscriptionEnd,SubscriptionStart)) as 
avg_subscription_duration
from
[dbo].[CustomerData$]

........calculate total revenue by subscription type......select
SubscriptionType,
sum(Revenue) as total_revenue
from [dbo].[CustomerData$]
group by 
SubscriptionType

select * from [dbo].[CustomerData$]


.......find the top 3 regions by subscription cancellations.....
select
Region,
COUNT(*) as cancellation_count
from
[dbo].[CustomerData$]
where
Canceled = '1'
group by
Region
order by
cancellation_count desc
limit 3;


........find the total number of active and canceled subscriptions.........selectCanceledCount(*) as Total_subcriptionswhere Canceled = '1' as canceled  and '0' as activefrom[dbo].[CustomerData$]group byCanceled.......find customers with subscriptions longer than 12 months......selectCustomerNamefrom[dbo].[CustomerData$]whereDATEDIFF(DAYOFYEAR,SubscriptionStart, SubscriptionEnd)>365