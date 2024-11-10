Select * From [dbo].[capstonesalesproject]

--------- Total sales for each product category---------------

Select Product, sum(Sales) As TotalSales from [dbo].[capstonesalesproject]
Group by PRODUCT

--------Number of sales transactions in each region------------------

 Select Region,Count(*) As Transaction_Number From [dbo].[capstonesalesproject]
 Group By Region


 ------------------The highest-selling product by total sales value--------------

 Select Top 1 Product, Sum(Sales) As HighestSellingProduct From [dbo].[capstonesalesproject]
 group by Product

 ------------------- Total Revenue per product-----------------------------------
 
 Select Product, Sum(Quantity * Unitprice) As TotalRevenue From [dbo].[capstonesalesproject]
 Group by Product
 Order By TotalRevenue Desc

 Select * From [dbo].[capstonesalesproject]

 -------------------------------Monthly sales totals for the current year------------------
 Select Month(OrderDate) As Months, Sum(Sales) As MonthlySales From [dbo].[capstonesalesproject]
 Where year(OrderDAte) = 2024
 Group By Month(OrderDate)
 Order By Month(OrderDate)

  ------------------------------The top 5 customers by total purchase amount-----------------

 Select TOP 5 Customer_ID, Sum(Quantity*UnitPrice) As TotalPurchase_Amount From [dbo].[capstonesalesproject]
 Group by Customer_ID 
 Order By TotalPurchase_Amount Desc

--------------------------------The percentage of total sales contributed by each Region-------------------------------------- 

Select Region, Sum(Sales) As RegionalSales,(Sum(Sales)*100 / (Select (Sum(Sales)) 
From [dbo].[capstonesalesproject])) As PercentageSales From [dbo].[capstonesalesproject]
Group By Region
Order By PercentageSales Desc



----------------------------Identify products with no sales in the last quarter------

Select Product from [dbo].[capstonesalesproject]
Where Product NOT IN(
Select Distinct Product From [dbo].[capstonesalesproject]
Where OrderDate>=DateAdd(quarter,-1,Getdate()))
Group By Product

