select * from leads_project.sampledata;

SELECT * FROM leads_project. sampledata limit 20;
use leads_project;

select `Prospect ID`, `Lead Number` from sampledata;
describe sampledata;

select distinct company from sampledata;

select count(company) from sampledata
where company <> "";

select count(`Lead Source`) from sampledata
where `Lead Source` = "";

select `What matters most to you in choosing a course`, count(`What matters most to you in choosing a course`)
from sampledata
group by `What matters most to you in choosing a course`; 

create table lead_data
select `Prospect ID`, `Lead Number`, `Lead Origin`, `Lead Source`, `Do Not Email`, `Do Not Call`, `TotalVisits`, `Total Time Spent on Website`,
`Page Views Per Visit`, `Last Activity`, `Country`, `Specialization`, `How did you hear about X Education`, `What is your current occupation`,
`What matters most to you in choosing a course`, `Search`, `Magazine`, `Newspaper Article`, `X Education Forums`, `Newspaper`, `Digital Advertisement`, `Through Recommendations`,
`Receive More Updates About Our Courses`,`Tags`,`Lead Quality`, `Update me on Supply Chain Content`, `Get updates on DM Content`, `Lead Profile`, `City`, `Asymmetrique Activity Index`, `Asymmetrique Profile Index`,
`Asymmetrique Profile Score`, `I agree to pay the amount through cheque`, `A free copy of Mastering The Interview`, `Last Notable Activity`, `Converted`
from
sampledata;

SElect * from lead_data;

#version control
create table lead_data_v1 as select * from lead_data;

set sql_safe_updates= 0;

update lead_data_v1 set `Lead Source` = 'Others'
where lead_data_v1. `Lead Source` = '' ;

select distinct `Lead Source` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`What matters most to you in choosing a course` = 
case
	when lead_data_v1. `What matters most to you in choosing a course` = 'Others' 
	then 'Other'
	else lead_data_v1. `What matters most to you in choosing a course`
	end;

select distinct `What matters most to you in choosing a course` from lead_data_v1;
SElect * from lead_data_v1;

update lead_data_v1
set lead_data_v1.`Country` = 
Case
	when lead_data_v1.`Country` = ''
    then 'Other'
    else lead_data_v1.`Country`
    end;

select * from lead_data_v1;

update lead_data_v1
set lead_data_v1.`Specialization` = 
Case
	when lead_data_v1.`Specialization` = ''
    then 'Other'
    else lead_data_v1.`Specialization`
    end;

select distinct `Specialization` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`How did you hear about X Education` = 
Case
	when lead_data_v1.`How did you hear about X Education` = ''
    then 'Other'
    else lead_data_v1.`How did you hear about X Education`
    end;
select distinct `How did you hear about X Education ` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`What is your current occupation` = 
Case
	when lead_data_v1.`What is your current occupation` = ''
    then 'Other'
    else lead_data_v1.`What is your current occupation`
    end;
    
select distinct `What is your current occupation` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`Tags` = 
Case
	when lead_data_v1.`Tags` = ''
    then 'Other'
    else lead_data_v1.`Tags`
    end;
    
select distinct `Tags` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`Lead Quality` = 
Case
	when lead_data_v1.`Lead Quality` = ''
    then 'Other'
    else lead_data_v1.`Lead Quality`
    end;
select distinct `Lead Quality` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`Lead Profile` = 
Case
	when lead_data_v1.`Lead Profile` = 'Other'
    then 'Leads'
    else lead_data_v1.`Lead Profile`
    end;
    
select distinct `Lead Profile` from lead_data_v1;

update lead_data_v1
set lead_data_v1.`City` = 
Case
	when lead_data_v1.`City` = ''
    then 'Other Cities'
    else lead_data_v1.`City`
    end;
select distinct `City` from lead_data_v1;

SELECT country, COUNT(*) AS lead_count
FROM lead_data_v1
GROUP BY country
ORDER BY lead_count DESC;


SELECT `What is your current occupation`, COUNT(*) AS client_count
FROM lead_data_v1
WHERE `Country` = 'India'
GROUP BY `What is your current occupation`
ORDER BY client_count DESC;

SELECT 'lead source', COUNT(*) AS lead_count
FROM lead_data_v1
GROUP BY 'lead source'
ORDER BY lead_count DESC
LIMIT 1;

select * from lead_data_v1
limit 10;