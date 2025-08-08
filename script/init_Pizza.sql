-- Total Revenue from Pizza Sales
select sum(total_price) as Total_Revenue 
from pizza_sales

--The Average Order Value from Pizza Sales
select round(sum(total_price) / count(distinct order_id), 2) as Average_Order_Revenue 
from pizza_sales

--Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold
from Pizza_Sales

--Total Orders Placed
select count(distinct order_id) as Pizza_Sales
from Pizza_Sales

--Average Pizza Per Order
select cast(cast(sum(quantity) as decimal(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_Pizza_Per_Order
from pizza_sales

--Daily Trend for Total Orders
select DATENAME(DW, order_date) as Order_day, 
	   count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(DW, order_date)

--Monthly Trend for Trend Orders
select DATENAME(MONTH, order_date) as Order_day, 
	   count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH, order_date)
order by Total_orders desc

--Percentage of Sales by Pizza category
select pizza_category,
	   sum(total_price) as Total_Sales,	
	   round(sum(total_price) * 100
	   /
	   (select sum(total_price) from pizza_sales), 2) as PCT
from pizza_sales
group by pizza_category

--Percentage of Sales by Pizza Size
select pizza_size,
	   sum(total_price) as Total_Sales,	
	   round(sum(total_price) * 100
	   /
	   (select sum(total_price) from pizza_sales), 2) as PCT
from pizza_sales
group by pizza_size
order by pct desc

--Top 5 best sellers by Revenue
select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc

--Bottom 5 sellers by Revenue
select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue 

--Top 5 best sellers by Quantity 
select Top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc

--Bottom 5 sellers by Quantity 
select Top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity 

--Top 5 best sellers by Orders 
select Top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc

--Bottom 5 sellers by Orders 
select Top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders 
