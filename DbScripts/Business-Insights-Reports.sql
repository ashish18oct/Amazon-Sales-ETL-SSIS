--------------------Top 5 Best-Selling Product Categories

SELECT Top 5 
    dp.Category,
    SUM(fs.Quantity) AS TotalQty
FROM 
    dwh.FactSales fs
JOIN 
    dwh.DimProduct dp ON fs.ProductKey = dp.ProductKey
GROUP BY 
    dp.Category
ORDER BY 
    TotalQty DESC

--------------------- State-wise Revenue Contribution

SELECT 
    dl.State,
    SUM(fs.Quantity * fs.Amount) AS Revenue
FROM 
    dwh.FactSales fs
JOIN 
    dwh.DimLocation dl ON fs.LocationKey = dl.LocationKey
GROUP BY 
    dl.State
ORDER BY 
    Revenue DESC;

----------------------- Monthly Sales Trend

SELECT 
    dt.Year,
    dt.Month,
    SUM(fs.Quantity * fs.Amount) AS MonthlyRevenue
FROM 
    dwh.FactSales fs
JOIN 
    dwh.DimTime dt ON fs.TimeKey = dt.TimeKey
GROUP BY 
    dt.Year, dt.Month
ORDER BY 
    dt.Year, dt.Month;

------------------------- Fulfilment Performance

SELECT 
    dsc.Fulfilment,
    COUNT(*) AS OrderCount,
    SUM(fs.Quantity * fs.Amount) AS Revenue
FROM 
    dwh.FactSales fs
JOIN 
    dwh.DimSalesChannel dsc ON fs.SalesChannelKey = dsc.SalesChannelKey
GROUP BY 
    dsc.Fulfilment;

---------------------------Order Status Breakdown
SELECT 
    dos.Status,
    COUNT(*) AS TotalOrders
FROM 
    dwh.FactSales fs
JOIN 
    dwh.DimOrderStatus dos ON fs.OrderStatusKey = dos.OrderStatusKey
GROUP BY 
    dos.Status;

