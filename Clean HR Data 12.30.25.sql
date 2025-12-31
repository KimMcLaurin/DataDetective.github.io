-- Clean HR_Data - Used Excel to check for nulls and blanks
-- I validate data by checking for missing values, duplicates, out-of-range values, incorrect formats, 
-- and inconsistencies across datasets. I use Excel's conditional formatting and formulas for early-stage checks.  I use   
-- SQL for deeper validation such as duplicate detection, referential integrity, and business rule validation. 
-- I re-validate before using the data.

select * 
from hr_data;

-- Create a staging table

Create table hr_data_staging
like hr_data;

select *
from hr_data_staging;

insert hr_data_staging
select *
from hr_data;

select *
from hr_data_staging;

-- -- Remove the 'weird characters' at the beginning of the first column header, due to encoding

ALTER TABLE hr_data_staging
CHANGE COLUMN `ï»¿EmpID` EmpID VARCHAR(255);

select * 
from hr_data_staging;

-- Check for and remove any duplicates

select count(empid)
from hr_data_staging;

select distinct count(empid)
from hr_data_staging;

-- Standardize the BusinessTravel data

select *
from hr_data_staging;

select distinct * 
from hr_data_staging
where BusinessTravel like 'travelrarely';

update hr_data_staging
set businesstravel = 'Travel_Rarely'
where businesstravel like 'TravelRarely';

select *
from hr_data_staging;

-- Validate the AgeGroup data

select Age, AgeGroup
from hr_data_staging
where AgeGroup = '18-25';

select Age, AgeGroup
from hr_data_staging
where AgeGroup = '26-35';

select Age, AgeGroup
from hr_data_staging
where AgeGroup = '36-45';

select Age, AgeGroup
from hr_data_staging
where AgeGroup = '46-55';

select Age, AgeGroup
from hr_data_staging
where AgeGroup = '55+';

select *
from hr_data_staging;

-- Arrange Columns

select EmpID, Age, AgeGroup, Gender, MaritalStatus, Department, BusinessTravel, JobRole, HourlyRate, JobSatisfaction, PercentYearlySalaryHike, WorkLifeBalance
from hr_data_staging;

-- Order by EmpID

select EmpID, Age, AgeGroup, Gender, MaritalStatus, Department, BusinessTravel, JobRole, HourlyRate, JobSatisfaction, PercentYearlySalaryHike, WorkLifeBalance
from hr_data_staging
order by EmpID;

-- Check data types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr_data_staging';

select *
from hr_data_staging;

-- Check for outliers, anomalies

select distinct JobRole, HourlyRate
from hr_data_staging
where department = 'Sales'
order by HourlyRate;

select distinct JobRole, HourlyRate
from hr_data_staging
where department = 'Human Resources'
order by HourlyRate;

select distinct JobRole, HourlyRate
from hr_data_staging
where department = 'Research & Development'
order by HourlyRate;

select empId, PercentYearlySalaryHike
from hr_data_staging
order by PercentYearlySalaryHike;

-- Validate survey rules, field constraints followed

select distinct JobSatisfaction
from hr_data_staging;

select distinct WorkLifeBalance
from hr_data_staging;

-- Prove or disprove your theory before analysis, make sense

select DISTINCT agegroup, hourlyrate, jobrole
from hr_data_staging
order by agegroup;
-- Female	65.8443
-- Male	65.8459












