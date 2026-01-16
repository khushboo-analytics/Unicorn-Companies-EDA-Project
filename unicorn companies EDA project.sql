-- viewing sample data 
select*
from unicorncompanies;

-- checking total records
select count(*) AS total_rows
from unicorncompanies;

-- DATA CLEANING--

-- checking missing/null values

-- Total records
SELECT COUNT(*) AS total_rows
FROM unicorncompanies;

-- Column-wise null check
SELECT
    SUM(company IS NULL) AS company_nulls,
    SUM(valuation_billion IS NULL) AS valuation_nulls,
    SUM(date_joined IS NULL) AS date_nulls,
    SUM(country IS NULL) AS country_nulls,
    SUM(city IS NULL) AS city_nulls,
    SUM(industry IS NULL) AS industry_nulls,
    SUM(select_inverstors IS NULL) AS investors_nulls,
    SUM(founded_year IS NULL) AS founded_year_nulls,
    SUM(total_raised IS NULL) AS total_raised_nulls,
    SUM(financial_stage IS NULL) AS stage_nulls,
    SUM(investors_count IS NULL) AS investors_count_nulls,
    SUM(deal_terms IS NULL) AS deal_terms_nulls,
    SUM(portfolio_exits IS NULL) AS portfolio_exits_nulls
FROM unicorncompanies;

-- standardizing text columns

UPDATE unicorncompanies
SET 
company = trim(company),
country = trim(country),
city = trim(city),
industry = trim(industry),
financial_stage = trim(financial_stage),
deal_terms = trim(deal_terms);

-- removing duplicates 

DELETE FROM unicorncompanies
WHERE company in ( 
select company from (
select company from unicorncompanies
group by company
having count(*)>1
)temp 
);

-- fixing valuation_billion and total_raised 

UPDATE unicorncompanies
SET valuation_billion = REPLACE(valuation_billion, '$', '');

select* 
from unicorncompanies where trim(valuation_billion)='';

UPDATE unicorncompanies
SET valuation_billion = null
WHERE trim(valuation_billion)='' ;

ALTER TABLE unicorncompanies
MODIFY valuation_billion DECIMAL(10,2);

-- CHECKING FOR ERRORS IN total_raised
select total_raised from unicorncompanies 
where total_raised regexp '[^0-9.-]';

-- Remove the dollar sign '$'
UPDATE unicorncompanies
SET total_raised = REPLACE(total_raised, '$', '');

-- Remove the letter 'B' for billions
UPDATE unicorncompanies
SET total_raised = REPLACE(total_raised, 'B', '');

-- Remove the letter 'M' for millions
UPDATE unicorncompanies
SET total_raised = REPLACE(total_raised, 'M', '');

-- Remove any potential space characters ' '
UPDATE unicorncompanies
SET total_raised = REPLACE(total_raised, ' ', '');


SELECT total_raised
FROM unicorncompanies
WHERE total_raised IS NOT NULL
  AND total_raised != ''
  AND total_raised NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';
  
  UPDATE unicorncompanies
SET total_raised  = null
WHERE trim(total_raised )='' ;
  
  UPDATE unicorncompanies
SET total_raised = REPLACE(total_raised, ' ', '');

  UPDATE unicorncompanies
SET total_raised = NULL
WHERE total_raised NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

ALTER TABLE unicorncompanies
MODIFY total_raised  DECIMAL(10,2);

-- checking date format

select date_joined
from unicorncompanies
where date_joined is null;


-- EDA Exploratory Data Analysis--

-- unicorn growth over years

SELECT 
YEAR(date_joined)AS year,
count(*) as unicorn_count
FROM unicorncompanies
GROUP BY year
ORDER BY year;

-- top coutries by unicorn count

SELECT country,
count(*) AS total_unicorns
FROM unicorncompanies
GROUP BY country
ORDER BY country DESC LIMIT 10;

-- TOP cities producing unicorns

SELECT city,
count(*) AS unicorn_count
FROM unicorncompanies
GROUP BY city
ORDER BY unicorn_count DESC LIMIT 10;

-- most popular industries 

SELECT industry ,
count(*) AS unicorn_count
FROM unicorncompanies
GROUP BY industry
ORDER BY unicorn_count DESC LIMIT 10;

-- highest value unicorn companies

SELECT company, country , valuation_billion ,industry, total_raised
FROM unicorncompanies
ORDER BY valuation_billion DESC LIMIT 10;

-- average valuation & funding by industry

SELECT industry ,
ROUND(AVG(valuation_billion),2 )AS avg_valuation,
ROUND(AVG(total_raised),2 )AS avg_total_raised
FROM unicorncompanies
GROUP BY industry
ORDER BY avg_valuation DESC;

-- time taken to become an unicorn 

SELECT company, founded_year,
YEAR(date_joined) AS unicorn_year,
(YEAR(date_joined) -founded_year )AS years_to_unicorn
from unicorncompanies
WHERE founded_year IS NOT NULL;

-- investors appearing most frequently

SELECT select_inverstors,
count(*)AS investment_count
FROM unicorncompanies
GROUP BY select_inverstors
order by investment_count DESC LIMIT 10;

-- Yearly unicorn trend

with yearly_growth AS(
select
year(date_joined) AS year,
count(*) AS unicorn_count
FROM unicorncompanies
GROUP BY year
)
SELECT*
FROM yearly_growth
order by year;

-- Financial stage distribution

SELECT financial_stage,
count(*) AS company_count
FROM unicorncompanies
GROUP BY  financial_stage
ORDER BY company_count DESC;

-- fastest companies to reach unicorn status

SELECT company, 
YEAR(date_joined) AS unicorn_year,
(YEAR(date_joined) -founded_year )AS years_to_unicorn
from unicorncompanies
WHERE founded_year IS NOT NULL
ORDER BY years_to_unicorn ASC
LIMIT 10;

-- portfolio exits impact 

SELECT portfolio_exits ,
COUNT(*) AS companies,
ROUND(AVG(valuation_billion),2 )AS avg_valuation
FROM unicorncompanies
GROUP BY portfolio_exits
ORDER BY portfolio_exits DESC;

-- deal term analysis

SELECT deal_terms,
COUNT(*) AS deal_count
FROM unicorncompanies
GROUP BY deal_terms
ORDER BY deal_count DESC;

-- most active investor groups

SELECT select_inverstors,
COUNT(*) AS investment_frequency
FROM unicorncompanies
GROUP BY select_inverstors
ORDER BY investment_frequency DESC
LIMIT 10;

-- Purpose: industry level unicorn performance analysis
-- Industry wise unicorn count, average valuation, and funding comparison

WITH unicorn_metrics AS (
SELECT industry,
COUNT(*) AS unicorn_count ,
ROUND(AVG(valuation_billion),2 )AS avg_valuation,
ROUND(AVG(total_raised),2 )AS avg_funding
FROM unicorncompanies
GROUP BY industry)
SELECT*
FROM unicorn_metrics
ORDER BY unicorn_count DESC;













