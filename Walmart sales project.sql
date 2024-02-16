
#How many records are present?#
SELECT 
    COUNT(*) AS totalcount
FROM
    sales;
#Sales by Gender and city#
SELECT 
    COUNT(*) AS totalcount, Gender, City
FROM
    sales
GROUP BY Gender , City
ORDER BY totalcount;

#Sale timings and customer preference of time#
SELECT 
    *,
    CASE
        WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Time_of_Date'
FROM
    sales;
alter table sales add column timeofday  varchar(20);

UPDATE sales 
SET 
    timeofday = (CASE
        WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);

#Most used payment method#
SELECT 
    COUNT(Payment) AS mostusedpayment, Payment
FROM
    sales
GROUP BY Payment
ORDER BY mostusedpayment DESC;

#Average rating by customer type#
SELECT 
    ROUND(AVG(Rating), 1) AS memberavgrating, `Customer type`
FROM
    sales
GROUP BY `Customer type`
ORDER BY memberavgrating DESC;

#Total quantity sold by product line#
SELECT 
    SUM(Quantity) AS Totalquantitysold, `Product line`
FROM
    sales
GROUP BY `Product line`
ORDER BY Totalquantitysold DESC;
alter table sales  drop column timeofday;
select * from sales;

#Sum of Total sales by Product Line,CUsotmer type,Payment method,City#
SELECT 
    ROUND(SUM(Total), 1) AS Totalsales, `Product line`
FROM
    sales
GROUP BY `Product line`
ORDER BY Totalsales DESC;
SELECT 
    ROUND(SUM(Total), 1) AS Totalsales, `Customer type`
FROM
    sales
GROUP BY `Customer type`
ORDER BY Totalsales DESC;
SELECT 
    ROUND(SUM(Total), 1) AS Totalsales, Payment
FROM
    sales
GROUP BY Payment
ORDER BY Totalsales DESC;
SELECT 
    ROUND(SUM(Total), 1) AS Totalsales, City
FROM
    sales
GROUP BY City
ORDER BY Totalsales DESC;

#Sum of total sales by Product line and City#
SELECT 
    SUM(Quantity) AS Totalquantitysold, `Product line`
FROM
    sales
GROUP BY `Product line`
ORDER BY Totalquantitysold DESC
LIMIT 1;
SELECT 
    SUM(Quantity) AS Totalquantitysold, City
FROM
    sales
GROUP BY City
ORDER BY Totalquantitysold DESC
LIMIT 1;

#Month which had the highest COGS#
SELECT 
    ROUND(SUM(cogs), 0) totalcogs, Salemonth
FROM
    sales
GROUP BY Salemonth
ORDER BY totalcogs DESC
LIMIT 1;
RENAME TABLE `walmartsalesdata.csv` TO sales;
select * from sales;

#Most common product line by gender?#
SELECT 
    gender, `Product line`, COUNT(*)
FROM
    sales
GROUP BY gender , `Product line`;

#Total sales by gender#
SELECT 
    ROUND(SUM(Total), 0) AS totalsales, Gender
FROM
    sales
GROUP BY Gender
ORDER BY totalsales DESC;
#Total sales by Customer type
SELECT 
    ROUND(SUM(Total), 0) AS totalsales, `Customer type`
FROM
    sales
GROUP BY `Customer type`
ORDER BY totalsales DESC;

#Branches which have sold more than or equal to the avg total Sales#
SELECT 
    ROUND(AVG(Total), 0) AS totalavgsaleperbranch, Branch
FROM
    sales
GROUP BY Branch
HAVING totalavgsaleperbranch >= (SELECT 
        ROUND(AVG(Total), 0)
    FROM
        sales);

#Cities which have sold more than or equal to the avg total Sales#
SELECT 
    ROUND(AVG(Total), 0) AS totalavgsalepercity, City
FROM
    sales
GROUP BY City
HAVING totalavgsalepercity >= (SELECT 
        ROUND(AVG(Total), 0)
    FROM
        sales);


#Product lines which have sold more than or equal to the avg total Sales#
SELECT 
    ROUND(AVG(Total), 0) AS totalavgsaleperproductline,
    `Product line`
FROM
    sales
GROUP BY `Product line`
HAVING totalavgsaleperproductline >= (SELECT 
        ROUND(AVG(Total), 0)
    FROM
        sales);











