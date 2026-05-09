USE INSURENCE;
/*Insurance Analysis*/

/*
1. Total Policy
*/

SELECT COUNT(`ï»¿Policy ID`) AS 'Total Policy'
FROM INSURENCE.`policy details`;

/*
2. Total Customers
*/

SELECT COUNT(`ï»¿Customer ID`) AS 'Total Customers'
FROM INSURENCE.`policy data`;


/*
3. Age Bucket Wise Policy Count
*/
USE insurence;

SELECT 
CASE 
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS Age_Bucket,
COUNT(`ï»¿Customer ID`) AS Policy_Count
FROM `policy data`
GROUP BY Age_Bucket
ORDER BY Age_Bucket;
/* 4-Gender Wise Policy Count*/
SELECT 
    Gender,
    COUNT(`ï»¿Customer ID`) AS Policy_Count
FROM 
    `policy data`
GROUP BY 
    Gender;

DROP TABLE claims;

/*
5. Policy Type Wise Policy Count
*/
SELECT 
    `Policy Type`,
    COUNT(`ï»¿Policy ID`) AS policy_count
FROM 
    `policy details`
GROUP BY 
    `Policy Type`;
    
    /*
    6-Policy Expire This Year
     */
     SELECT 
    COUNT(`ï»¿Policy ID`) AS Policies_Expiring_This_Year
FROM 
    `policy details`
WHERE 
    YEAR(`Policy End Date`) = YEAR(CURDATE());
    /*
    7-Premium Growth Rate
   */
 SELECT 
((SUM(`Policy Start Date`) - SUM(`Premium Amount`)) 
/ SUM(`Policy Start Date`)) * 100 AS Premium_Growth_Rate
FROM `policy details`;
  
  SELECT YEAR(`Policy Start Date`), SUM(`Premium Amount`)
FROM `policy details`
GROUP BY YEAR(`Policy Start Date`);

/*
8-Claim Status Wise Policy Count
*/
SELECT 
    `Claim Status`,
    COUNT(`Claim ID`) AS policy_count
FROM 
     claims
GROUP BY 
    `Claim Status`;
    
/*
9-Payment Status Wise Policy Count
*/
SELECT 
    `Payment Status`,
    COUNT(`ï»¿Payment ID`) AS policy_count
FROM 
    `payment history`
GROUP BY 
    `Payment Status`;
    
    
    /*
    10-Total Claim Amount
    */
    
SELECT SUM(`Claim Amount`) AS Total_Claim_Amount
FROM  CLAIMS;


/* THE END  */

    
