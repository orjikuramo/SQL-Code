/* 1.Write a query to select all columns from the `Sales` table. */
Select *
From [TDIWk2Sales]

/* 2. Write a query to find all sales where the `Quantity` is greater than 10. */
Select *
From [TDIWk2Sales]
Where [Quantity] > 10

/* 3. Write a query to find all sales where the `Quantity` is greater than 10 and the `UnitPrice` is greater than 20.*/
Select *
From [TDIWk2Sales]
Where [Quantity] > 9
And [Unit price] > 20

/* 4. Write a query to find all sales where the `Quantity` is greater than 10 or the `UnitPrice` is greater than 20. */
Select *
From [TDIWk2Sales]
Where [Quantity] > 10
OR [Unit Price] > 20

/* 5. Write a query to select all columns from the `Sales` table and order the results by `SaleDate` in ascending order.*/
Select *
From [TDIWk2Sales]
Order by [SaleDate] Asc

/* 6. Write a query to select all columns from the `Sales` table and order the results by `UnitPrice` in descending order. */
Select *
From [TDIWk2Sales]
Order by [Unit price] Desc

/* 7. Write a query to group the sales by `ProductID` and calculate the total quantity sold for each product.*/
Select [ProductID], SUM([Quantity]) As TotalQuantity
From [TDIWk2Sales]
Group by [ProductID]

/* 8. Write a query to group the sales by `ProductID` and find products that have sold more than 100 units in total.*/
Select [ProductID], SUM([Quantity]) As TotalQuantity
From [TDIWk2Sales]
Group By [ProductID]
Having SUM([Quantity]) > 100

/* 9. Write a query to count the number of sales that occurred for each product. */
Select [ProductID], COUNT(*) As TimesSold
From [TDIWk2Sales]
Group By [ProductID]

/* 10. Write a query to calculate the total revenue (Quantity * UnitPrice) for each product.*/
Select [ProductID], SUM([Quantity]*[Unit Price]) As TotalRevenue
From [TDIWk2Sales]
Group By [ProductID]
Order By [TotalRevenue] Desc

/* 11. Write a query to calculate the average `UnitPrice` for each product.*/
Select [ProductID], AVG([Unit Price]) As AvgUnitPrice
From [TDIWk2Sales]
Group By [ProductID]
Order By [AvgUnitPrice] Desc

/* 12. Write a query to find the minimum `UnitPrice` for each product.*/
Select [ProductID], MIN([Unit Price]) As MinUnitPrice
From [TDIWk2Sales]
Group By [ProductID]
Order By [MinUnitPrice]Desc

/* 13. Write a query to find the maximum `UnitPrice` for each product.*/
Select [ProductID], MAX([Unit Price]) As MaxUnitPrice
From [TDIWk2Sales]
Group By [ProductID]
Order By [MaxUnitPrice]Desc

/* 14. Write a query to find all sales where the `Quantity` is greater than 5 and the `SaleDate` is in the year 2023.*/
Select *
From [TDIWk2Sales]
Where [Quantity] > 5
AND CAST([SaleDate] As Date) = 2023

/* 15. Write a query to select all columns from the `Sales` table and order the results by `ProductID` and then by `SaleDate` in ascending order.*/
Select *
From [TDIWk2Sales]
Order By [ProductID], [SaleDate] Asc

/* 16.Write a query to group the sales by `CustomerID` and find customers who have made purchases worth more than $500 in total.*/
Select [Customer ID], SUM([Quantity]*[Unit Price]) As Revenue
From [TDIWk2Sales]
Group By [Customer ID]
Having SUM([Quantity]*[Unit Price]) > 500
Order by [Revenue] Desc

/* 17. Write a query to group the sales by `ProductID` and count the number of sales for each product where the total number of sales is more than 50.*/
Select [ProductID], COUNT([ProductID]) As CountOfProduct
From [TDIWk2Sales]
Group By [ProductID]
Having COUNT([ProductID]) > 50

/* 18. Write a query to calculate the total revenue for sales where the `UnitPrice` is greater than 15.*/
Select [Unit price], [Quantity], ([Unit Price]*[Quantity]) As Revenue
From [TDIWk2Sales]
Where [Unit Price] > 15

/* 19. Write a query to group the sales by `ProductID` and calculate the average `Quantity` sold for each product.*/
Select [ProductID], AVG([Quantity]) As AvgQuantity
From [TDIWk2Sales]
Group By [ProductID]

/* 20. Write a query to select `ProductID`, count the number of sales, and calculate the total revenue for each product. 
Only include products that have more than 20 sales and order the results by total revenue in descending order.*/
Select [ProductID], COUNT(*) As ProductCount, SUM([Quantity]*[Unit Price]) As Revenue
From [TDIWk2Sales]
Group By [ProductID]
Having COUNT(*) > 20
Order By [Revenue] Desc



