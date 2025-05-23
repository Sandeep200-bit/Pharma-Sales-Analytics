use pharma_sales_db ;

select * from salesdaily ;

select * from saleshourly ;

select * from salesmonthly ;

select * from salesweekly ;
 

ALTER TABLE salesdaily
CHANGE datum Sale_Date text,
CHANGE M01AB Anti_Inflam_Acetic int,
CHANGE M01AE Anti_Inflam_Propionic double,
CHANGE N02BA Analgesic_Salicylic double,
CHANGE N02BE Analgesic_Anilide double,
CHANGE N05B Anxiolytics INT,
CHANGE N05C Sedatives INT,
CHANGE R03 Respiratory_Drugs INT,
CHANGE R06 Antihistamines int,
CHANGE Year Sale_Year INT,
CHANGE Month Sale_Month INT,
CHANGE Hour Sale_Hour INT,
CHANGE `Weekday Name` Day_Name text;


ALTER TABLE saleshourly
CHANGE datum Sale_Date text,
CHANGE M01AB Anti_Inflam_Acetic int,
CHANGE M01AE Anti_Inflam_Propionic double,
CHANGE N02BA Analgesic_Salicylic double,
CHANGE N02BE Analgesic_Anilide int,
CHANGE N05B Anxiolytics INT,
CHANGE N05C Sedatives INT,
CHANGE R03 Respiratory_Drugs INT,
CHANGE R06 Antihistamines int,
CHANGE Year Sale_Year INT,
CHANGE Month Sale_Month INT,
CHANGE Hour Sale_Hour INT,
CHANGE `Weekday Name` Day_Name text;

ALTER TABLE salesmonthly
CHANGE datum Sale_Date DATETIME,
CHANGE M01AB Anti_Inflam_Acetic double,
CHANGE M01AE Anti_Inflam_Propionic double,
CHANGE N02BA Analgesic_Salicylic double,
CHANGE N02BE Analgesic_Anilide double,
CHANGE N05B Anxiolytics double,
CHANGE N05C Sedatives double,
CHANGE R03 Respiratory_Drugs double,
CHANGE R06 Antihistamines double;


ALTER TABLE salesweekly
CHANGE datum Sale_Date text,
CHANGE M01AB Anti_Inflam_Acetic double,
CHANGE M01AE Anti_Inflam_Propionic double,
CHANGE N02BA Analgesic_Salicylic double,
CHANGE N02BE Analgesic_Anilide double,
CHANGE N05B Anxiolytics INT,
CHANGE N05C Sedatives INT,
CHANGE R03 Respiratory_Drugs INT,
CHANGE R06 Antihistamines double;



-- Check for missing values in each table
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Anti_Inflam_Acetic IS NULL THEN 1 ELSE 0 END) AS missing_anti_inflam,
    SUM(CASE WHEN Analgesic_Anilide IS NULL THEN 1 ELSE 0 END) AS missing_analgesics
FROM salesdaily;

-- Check for missing values in each table
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Anti_Inflam_Acetic IS NULL THEN 1 ELSE 0 END) AS missing_anti_inflam,
    SUM(CASE WHEN Analgesic_Anilide IS NULL THEN 1 ELSE 0 END) AS missing_analgesics
FROM saleshourly;

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Anti_Inflam_Acetic IS NULL THEN 1 ELSE 0 END) AS missing_anti_inflam,
    SUM(CASE WHEN Analgesic_Anilide IS NULL THEN 1 ELSE 0 END) AS missing_analgesics
FROM salesmonthly;

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Anti_Inflam_Acetic IS NULL THEN 1 ELSE 0 END) AS missing_anti_inflam,
    SUM(CASE WHEN Analgesic_Anilide IS NULL THEN 1 ELSE 0 END) AS missing_analgesics
FROM salesweekly;


select * from salesdaily ;

select * from saleshourly ;

select * from salesmonthly ;

select * from salesweekly ;
 
CREATE VIEW daily_sales_summary AS
SELECT 
    Sale_Date,
    Day_Name,
    Sale_Year,
    Sale_Month,
    SUM(Anti_Inflam_Acetic) AS total_anti_inflam,
    SUM(Analgesic_Anilide) AS total_analgesics,
    SUM(Anxiolytics) AS total_anxiolytics
FROM salesdaily
GROUP BY Sale_Date, Day_Name, Sale_Year, Sale_Month;


-- Monthly category performance view
CREATE VIEW monthly_category_performance AS
SELECT 
    YEAR(Sale_Date) AS year,
    MONTH(Sale_Date) AS month,
    AVG(Anti_Inflam_Acetic) AS avg_anti_inflam,
    AVG(Analgesic_Anilide) AS avg_analgesics,
    SUM(Respiratory_Drugs) AS total_respiratory
FROM salesmonthly
GROUP BY YEAR(Sale_Date), MONTH(Sale_Date);

-- Weekly trends view
CREATE VIEW weekly_trends AS
SELECT 
    YEAR(Sale_Date) AS year,
    WEEK(Sale_Date) AS week_num,
    SUM(Anti_Inflam_Propionic) AS total_propionic,
    SUM(Sedatives) AS total_sedatives,
    SUM(Antihistamines) AS total_antihistamines
FROM salesweekly
GROUP BY YEAR(Sale_Date), WEEK(Sale_Date);

SHOW FULL TABLES IN pharma_sales_db WHERE TABLE_TYPE LIKE 'VIEW';


let continue in python work --------------------





























































































































































































































































































