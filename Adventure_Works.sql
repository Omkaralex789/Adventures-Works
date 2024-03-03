Create Database Adventure_Works;
use Adventure_Works;

SELECT *
 FROM adventure_works.factinternetsales
UNION ALL
SELECT * FROM adventure_works.fact_internet_sales_new;


SELECT COALESCE(a.ProductKey, b.ProductKey) AS Productkey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey, 
    COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS Neworderdatekey, COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS Orderquantity, 
    COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS Unitpricediscount, COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmt, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
    COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductionCost, COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
FROM fact_internet_sales_new a
LEFT JOIN factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.Neworderdatekey = b.Neworderdatekey
UNION
SELECT  COALESCE(a.ProductKey, b.ProductKey) AS Productkey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey, 
    COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS Neworderdatekey, COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS Orderquantity, 
    COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS Unitpricediscount, COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmt, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
    COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductionCost ,COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
FROM fact_internet_sales_new a
RIGHT JOIN 
    factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.Neworderdatekey = b.NewOrderDateKey;


---- 2) join on dimcustomer 
SELECT COALESCE(ab.ProductKey, ab.ProductKey) AS Productkey, COALESCE(ab.Customerkey, ab.Customerkey) AS Customerkey, COALESCE(ab.OrderDateKey, ab.OrderDateKey) AS OrderDatekey,  COALESCE(ab.NewOrderDateKey, ab.NewOrderDateKey) AS Neworderdatekey,
    COALESCE(ab.UnitPrice, ab.UnitPrice) AS UnitPrice, COALESCE(ab.OrderQuantity, ab.OrderQuantity) AS Orderquantity, COALESCE(ab.UnitPriceDiscountPct, ab.UnitPriceDiscountPct) AS Unitpricediscount,
    COALESCE(ab.DiscountAmount, ab.DiscountAmount) AS DiscountAmt, COALESCE(ab.ProductStandardCost, ab.ProductStandardCost) AS ProductStandardCost, COALESCE(ab.TotalProductCost, ab.TotalProductCost) AS TotalProductionCost, COALESCE(ab.SalesTerritoryKey,ab.SalesTerritoryKey) AS SalesTerritorykey,
    d.FirstName, 
    d.MiddleName, 
    d.LastName
FROM (
        SELECT COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey,  COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost ,COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM fact_internet_sales_new a
        LEFT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.NewOrderDateKey = b.NewOrderDateKey
        UNION
        SELECT COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey,  COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey, COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
            COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost,COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM fact_internet_sales_new a
        RIGHT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.NewOrderDateKey = b.NewOrderDateKey
    ) AS ab
LEFT JOIN 
    Dimcustomer d ON ab.Customerkey = d.Customerkey; 
    
    ---- 3)  join on dimcustomer
    SELECT 
    COALESCE(ab.ProductKey, ab.ProductKey) AS Productkey, 
    COALESCE(ab.Customerkey, ab.Customerkey) AS Customerkey, COALESCE(ab.OrderDateKey, ab.OrderDateKey) AS OrderDatekey,  
    COALESCE(ab.NewOrderDateKey, ab.NewOrderDateKey) AS Neworderdatekey,
    COALESCE(ab.UnitPrice, ab.UnitPrice) AS UnitPrice, 
    COALESCE(ab.OrderQuantity, ab.OrderQuantity) AS Orderquantity, 
    COALESCE(ab.UnitPriceDiscountPct, ab.UnitPriceDiscountPct) AS Unitpricediscount,
    COALESCE(ab.DiscountAmount, ab.DiscountAmount) AS DiscountAmt, 
    COALESCE(ab.ProductStandardCost, ab.ProductStandardCost) AS ProductStandardCost, 
    COALESCE(ab.TotalProductCost, ab.TotalProductCost) AS TotalProductionCost,
    COALESCE(ab.SalesTerritoryKey,ab.SalesTerritoryKey) AS SalesTerritorykey,
    d.FirstName, 
    d.MiddleName, 
    d.LastName,
    p.EnglishProductName -- Selecting only the English product name
FROM (
        SELECT 
            COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, 
            COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey, 
            COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, 
            COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, 
            COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, 
            COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
            COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost,
            COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM 
            fact_internet_sales_new a
        LEFT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey 
                                  AND a.CustomerKey = b.CustomerKey 
                                  AND a.NewOrderDateKey = b.NewOrderDateKey
        UNION
        SELECT 
            COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, 
            COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey, 
            COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, 
            COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, 
            COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, 
            COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
            COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost,
            COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM 
            fact_internet_sales_new a
        RIGHT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey 
                                   AND a.CustomerKey = b.CustomerKey 
                                   AND a.NewOrderDateKey = b.NewOrderDateKey
    ) AS ab
LEFT JOIN 
    Dimcustomer d ON ab.Customerkey = d.Customerkey
LEFT JOIN
    Dimproduct p ON ab.ProductKey = p.ProductKey;


    ----- creating view for transformation 
    create view Salestable As 
    SELECT COALESCE(ab.ProductKey, ab.ProductKey) AS Productkey, COALESCE(ab.Customerkey, ab.Customerkey) AS Customerkey,COALESCE(ab.OrderDateKey, ab.OrderDateKey) AS OrderDatekey,  COALESCE(ab.NewOrderDateKey, ab.NewOrderDateKey) AS Neworderdatekey,
    COALESCE(ab.UnitPrice, ab.UnitPrice) AS UnitPrice, COALESCE(ab.OrderQuantity, ab.OrderQuantity) AS Orderquantity, COALESCE(ab.UnitPriceDiscountPct, ab.UnitPriceDiscountPct) AS Unitpricediscount,
    COALESCE(ab.DiscountAmount, ab.DiscountAmount) AS DiscountAmt, COALESCE(ab.ProductStandardCost, ab.ProductStandardCost) AS ProductStandardCost, COALESCE(ab.TotalProductCost, ab.TotalProductCost) AS TotalProductionCost , COALESCE(ab.SalesTerritoryKey,ab.SalesTerritoryKey) AS SalesTerritorykey,
    d.FirstName, 
    d.MiddleName, 
    d.LastName ,
    p.EnglishProductName -- Selecting only the English product name
FROM (
        SELECT COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey,COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey,  COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost,  COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM fact_internet_sales_new a
        LEFT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.NewOrderDateKey = b.NewOrderDateKey
        UNION
        SELECT COALESCE(a.ProductKey, b.ProductKey) AS ProductKey, COALESCE(a.Customerkey, b.Customerkey) AS Customerkey, COALESCE(a.OrderDateKey, b.OrderDateKey) AS OrderDatekey,  COALESCE(a.NewOrderDateKey, b.NewOrderDateKey) AS NewOrderDateKey,
            COALESCE(a.UnitPrice, b.UnitPrice) AS UnitPrice, COALESCE(a.OrderQuantity, b.OrderQuantity) AS OrderQuantity, COALESCE(a.UnitPriceDiscountPct, b.UnitPriceDiscountPct) AS UnitPriceDiscountPct,
            COALESCE(a.DiscountAmount, b.DiscountAmount) AS DiscountAmount, COALESCE(a.ProductStandardCost, b.ProductStandardCost) AS ProductStandardCost, 
            COALESCE(a.TotalProductCost, b.TotalProductCost) AS TotalProductCost, COALESCE(a.SalesTerritoryKey,b.SalesTerritoryKey) AS SalesTerritorykey
        FROM fact_internet_sales_new a
        RIGHT JOIN 
            factinternetsales b ON a.ProductKey = b.ProductKey AND a.CustomerKey = b.CustomerKey AND a.NewOrderDateKey = b.NewOrderDateKey
    ) AS ab
LEFT JOIN 
    Dimcustomer d ON ab.Customerkey = d.Customerkey
    LEFT JOIN
    Dimproduct p ON ab.ProductKey = p.ProductKey;
    
    SELECT * FROM adventure_works.salestable;
    
  ----- calculations
  SELECT
    *,
    YEAR(Newdate) AS NewYear,
    MONTHNAME(Newdate) AS FullMonthName,
    MONTH(Newdate) AS Newmonth,
    QUARTER(Newdate) AS Newquarter,
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth,
    WEEKDAY(Newdate) AS Weekno,
    DAYNAME(Newdate) AS WeekdayName,
    Orderquantity * UnitPrice * (1 - Unitpricediscount) AS SalesAmount,
    Orderquantity * UnitPrice AS ProductionCost,
    (Orderquantity * UnitPrice * (1 - Unitpricediscount)) - TotalProductionCost AS Profit,
    CASE 
        WHEN MONTH(Newdate) BETWEEN 4 AND 12 THEN MONTH(Newdate) - 3
        ELSE MONTH(Newdate) + 9
    END AS FinancialMonth
FROM
    (SELECT *,
            CONCAT(
                SUBSTRING(OrderDatekey, 1, 4), '-', -- Extracting Year
                SUBSTRING(OrderDatekey, 5, 2), '-', -- Extracting Month
                SUBSTRING(OrderDatekey, 7, 2) -- Extracting Day
            ) AS Newdate
     FROM salestable) AS subquery_alias
LIMIT 0, 1000;


------ create view 2)
 CREATE VIEW salestable2 AS
SELECT
    *,
    YEAR(Newdate) AS NewYear,
    MONTHNAME(Newdate) AS FullMonthName,
    MONTH(Newdate) AS Newmonth,
    QUARTER(Newdate) AS Newquarter,
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth,
    WEEKDAY(Newdate) AS Weekno,
    DAYNAME(Newdate) AS WeekdayName,
    Orderquantity * UnitPrice * (1 - Unitpricediscount) AS SalesAmount,
    Orderquantity * UnitPrice AS ProductionCost,
    (Orderquantity * UnitPrice * (1 - Unitpricediscount)) - TotalProductionCost AS Profit,
    CASE 
        WHEN MONTH(Newdate) BETWEEN 4 AND 12 THEN MONTH(Newdate) - 3
        ELSE MONTH(Newdate) + 9
    END AS FinancialMonth
FROM
    (SELECT *,
            CONCAT(
                SUBSTRING(OrderDatekey, 1, 4), '-', -- Extracting Year
                SUBSTRING(OrderDatekey, 5, 2), '-', -- Extracting Month
                SUBSTRING(OrderDatekey, 7, 2) -- Extracting Day
            ) AS Newdate
     FROM salestable) AS subquery_alias;
 
 ---- 
SELECT s.*, dt.SalesTerritoryRegion, dt.SalesTerritoryCountry
FROM salestable2 s
JOIN dimsalesterritory dt ON s.SalesTerritoryKey = dt.SalesTerritoryKey;

------ 
CREATE VIEW Saletable3 AS
SELECT s.*, dt.SalesTerritoryRegion, dt.SalesTerritoryCountry
FROM salestable2 s
JOIN dimsalesterritory dt ON s.SalesTerritoryKey = dt.SalesTerritoryKey;


	
------ 1) Year Wise Sale 
SELECT NewYear, CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M') as TotalSales  
FROM salestable2 
Group By NewYear;
     
 ------ 2) Month Wise Sale  
 SELECT FullMonthName ,CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M') as TotalSales  
FROM salestable2 
Group By FullMonthName;

 ------ 3) Quarter Wise Sale  
 SELECT Newquarter ,CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M')as TotalSales  
FROM salestable2 
Group By Newquarter;

 ------ 4)  Sales Amt And Production Cost  
 SELECT FullMonthName ,CONCAT(FORMAT(Sum(TotalProductionCost)/1000000, 0), 'M') As TotalProductionCost , CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M')as TotalSales
FROM saletable3
group by FullMonthName ;


---- 5) Monthly Profit
 SELECT FullMonthName ,CONCAT(FORMAT(Sum(Profit)/1000000, 0), 'M')as TotalProfit 
FROM saletable3
Group By FullMonthName;

----- 6) Country Wise sales and profit
select SalesTerritoryRegion, CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M')as TotalSales ,CONCAT(FORMAT(Sum(Profit)/1000000, 0), 'M')as TotalProfit 
FROM saletable3
Group By SalesTerritoryRegion;

----- year profit %
select NewYear,CONCAT(FORMAT(Sum(Profit)/1000000, 0), 'M')as TotalProfit ,
CONCAT(FORMAT((SUM(Profit) / SUM(SalesAmount) * 100), 2), '%') AS ProfitPercentage
FROM saletable3
Group By NewYear;

----- countrywise sales
select SalesTerritoryCountry, CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M')as TotalSales 
FROM saletable3
group by SalesTerritoryCountry;

---- Total Order qty
select sum(Orderquantity) 
FROM saletable3;

---- top 10 Product 
select EnglishProductName,CONCAT(FORMAT(Sum(SalesAmount)/1000000, 0), 'M')as TotalSales 
FROM saletable3
group by EnglishProductName
limit 10;

---- full details by country filter 
SELECT CONCAT(FirstName, ' ', COALESCE(MiddleName, ''), ' ', LastName) AS FullName, round(sum(SalesAmount),2) AS TotalSales ,
round(sum(Profit),2)as TotalProfit , round(sum(TotalProductionCost),2) as TotalProductioncost, sum(Orderquantity) as TotalOrderQuantity
FROM saletable3
WHERE SalesTerritoryCountry = "United States"
GROUP BY 
    CONCAT(FirstName, ' ', COALESCE(MiddleName, ''), ' ', LastName);









	




    
    
    
    
    





















































































































select * from  sales_internet ;
--- 1)
SELECT * ,
    CONCAT(
        SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
        SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
        SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
    ) AS Newdate
 FROM sales_internet ;

---- 2)
SELECT *, YEAR(Newdate) AS NewYear
FROM (
    SELECT *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM sales_internet
) AS subquery_alias;

 ---- 3)
 SELECT *, YEAR(Newdate) AS NewYear, month(Newdate) AS Newmonth
FROM (
    SELECT 
        *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM sales_internet
) AS subquery_alias;


---- 4)
 SELECT *, YEAR(Newdate) AS NewYear ,MONTHNAME(Newdate) AS FullMonthName , month(Newdate) AS Newmonth
FROM (
    SELECT 
        *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM sales_internet
) AS subquery_alias;

----- 5) 
 SELECT *,YEAR(Newdate) AS NewYear ,MONTHNAME(Newdate) AS FullMonthName , month(Newdate) AS Newmonth , quarter(Newdate) As Newquarter 
FROM (
    SELECT 
        *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM sales_internet
) AS subquery_alias;


----- 6)
 SELECT *, YEAR(Newdate) AS NewYear ,MONTHNAME(Newdate) AS FullMonthName , month(Newdate) AS Newmonth , quarter(Newdate) As Newquarter , 
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth
FROM (SELECT *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM sales_internet
) AS subquery_alias;

---- 7)
 SELECT *,
    YEAR(Newdate) AS NewYear ,MONTHNAME(Newdate) AS FullMonthName , month(Newdate) AS Newmonth , quarter(Newdate) As Newquarter , 
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth , weekday(Newdate) as Weekno
FROM (SELECT *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM 
        sales_internet
) AS subquery_alias;


----- 8)
 SELECT *,
    YEAR(Newdate) AS NewYear ,MONTHNAME(Newdate) AS FullMonthName , month(Newdate) AS Newmonth , quarter(Newdate) As Newquarter , 
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth , weekday(Newdate) as Weekno, dayname(Newdate) 
FROM (SELECT *,
        CONCAT(
            SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
            SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
            SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
        ) AS Newdate
    FROM 
        sales_internet
) AS subquery_alias;


---- 9)
SELECT
    *,
    YEAR(Newdate) AS NewYear,
    MONTHNAME(Newdate) AS FullMonthName,
    MONTH(Newdate) AS Newmonth,
    QUARTER(Newdate) AS Newquarter,
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth,
    WEEKDAY(Newdate) AS Weekno,
    DAYNAME(Newdate) AS WeekdayName,
    CASE 
        WHEN MONTH(Newdate) BETWEEN 4 AND 12 THEN MONTH(Newdate) - 3
        ELSE MONTH(Newdate) + 9
    END AS FinancialMonth
FROM
    (SELECT *,
            CONCAT(
                SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
                SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
                SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
            ) AS Newdate
     FROM sales_internet) AS subquery_alias
LIMIT 0, 1000;


----- 10)
SELECT
    *,
    YEAR(Newdate) AS NewYear,
    MONTHNAME(Newdate) AS FullMonthName,
    MONTH(Newdate) AS Newmonth,
    QUARTER(Newdate) AS Newquarter,
    CONCAT(YEAR(Newdate), '-', LPAD(MONTHNAME(Newdate), 3, '0')) AS YearMonth,
    WEEKDAY(Newdate) AS Weekno,
    DAYNAME(Newdate) AS WeekdayName,
   CONCAT('Q', QUARTER(Newdate)) as FinancialQuarter,
    CASE 
        WHEN MONTH(Newdate) BETWEEN 4 AND 12 THEN MONTH(Newdate) - 3
        ELSE MONTH(Newdate) + 9
    END AS FinancialMonth
FROM
    (SELECT *,
            CONCAT(
                SUBSTRING(orderdatekey, 1, 4), '-', -- Extracting Year
                SUBSTRING(orderdatekey, 5, 2), '-', -- Extracting Month
                SUBSTRING(orderdatekey, 7, 2) -- Extracting Day
            ) AS Newdate
     FROM sales_internet) AS subquery_alias
LIMIT 0, 1000;












	