/*Insurance Analysis*/

/*
1. Total Policy
*/

SELECT COUNT(policy_id) AS 'Total Policy'
FROM policy_data.`policy details`;

/*
2. Total Customers
*/

SELECT COUNT(customer_ID) AS 'Total Customers'
FROM policy_data.`policy data`;

/*
3. Age Bucket Wise Policy Count
*/

SELECT 
	CASE 
		WHEN age < 28 THEN '18-27'
        WHEN age BETWEEN 28 AND 37 THEN '28-37'
        WHEN age BETWEEN 38 AND 47 THEN '38-47'
        WHEN age BETWEEN 48 AND 57 THEN '48-57'
        WHEN age BETWEEN 58 AND 67 THEN '58-67'
        WHEN age BETWEEN 68 AND 77 THEN '68-77'
        WHEN age BETWEEN 78 AND 87 THEN '78-87'
        ELSE '88+'
	END AS Age_Bucket,
	COUNT(p.`Policy_ID`) AS 'Policy Count'
FROM policy_data.`policy details` p
INNER JOIN policy_data.`policy data` c
	ON p.`Customer_ID` = c.`Customer_ID`
GROUP BY Age_Bucket
ORDER BY Age_Bucket;

/*
4. Gender Wise Policy Count
*/

SELECT
	CASE
		WHEN gender = 'Male' THEN 'Male'
        WHEN gender = 'Female' THEN 'Female'
        ELSE 'Other'
	END AS Gender_Bucket,
    COUNT(p.`Policy_ID`) AS 'Policy Count'
FROM policy_data.`policy details` p
INNER JOIN policy_data.`policy data` g
	ON p.`Customer_ID` = g.`Customer_ID`
GROUP BY Gender_Bucket
ORDER BY Gender_Bucket;

/*
5. Policy Type Wise Policy Count
*/

SELECT
	CASE 
		WHEN `Policy Type` = 'Auto' THEN 'Auto'
        WHEN `Policy Type` = 'Health' THEN 'Health'
        WHEN `Policy Type` = 'Life' THEN 'Life'
        ELSE 'Property'
	END AS Policy_Type,
    COUNT(`Policy_ID`) AS 'Policy Count'
FROM `policy details`
GROUP BY Policy_type;

/*
6. Policy Expire This Year
*/

SELECT
	'Expiring This Year' AS `Policy Status`,
    COUNT(`Policy_ID`) AS 'Total Expiring'
FROM `policy details`
WHERE YEAR(`Policy End Date`) = YEAR(CURDATE())
GROUP BY `Policy Status`;

/*
7. Premium Growth Rate
*/

WITH YearlyRevenue AS (
    SELECT 
        YEAR(`Policy Start Date`) AS Year,
        SUM(`Premium Amount`) AS TotalPremium
    FROM `policy details`
    GROUP BY Year
)
SELECT 
    Year,
    TotalPremium,
    LAG(TotalPremium) OVER (ORDER BY Year) AS LastYearPremium,
    ROUND(
        ((TotalPremium - LAG(TotalPremium) OVER (ORDER BY Year)) 
        / LAG(TotalPremium) OVER (ORDER BY Year)) * 100, 
    2) AS Growth_Percentage
FROM YearlyRevenue;

/*
8. Claim Status Wise Policy Count
*/

SELECT 
    Status, 
    COUNT(Policy_ID) AS Policy_Count
FROM `policy details`
GROUP BY Status;

/*
9. Payment Status Wise Policy Count
*/

SELECT 
    `Renewal Status`, 
    COUNT(`Policy_ID`) AS Policy_Count
FROM `additional fields`
GROUP BY `Renewal Status`;

/*
10. Total Claim Amount
*/

SELECT 
    `Claim Status`, 
    ROUND(SUM(`Claim Amount`), 2) AS Total_Amount
FROM claims
GROUP BY `Claim Status` WITH ROLLUP;
