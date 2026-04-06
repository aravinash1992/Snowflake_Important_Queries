-------------------------------------------------------------------------------------------------------------------------------

create or replace masking policy LANDING_PII.SF_CUSTOM_STRING as (val string) returns string ->
case
when current_role() in ('PII_USER','ADF_READ_WRITE_PII_DEV','POWER_BI_PII_DEV') then val
else '*********'
end;

create or replace masking policy LANDING_PII.SF_DOB_DATE as (val DATE) returns DATE ->
case
when current_role() in ('PII_USER','ADF_READ_WRITE_PII_DEV') then val
else to_date('9999-12-31')
end;

--------------------------------------------------------------------------------------------------------------------------------

alter table LANDING_PII.SFACTORS_PERPERSONAL_ANZ modify column CUSTOMSTRING1 set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table CURATED_PII.SFACTORS_PERPERSONAL_ANZ modify column GENDER set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table MASTER_PII.SFACTORS_DIM_PERPERSONAL_ANZ modify column GENDER set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table EXCPTN_PII.SFACTORS_PERPERSONAL_EXCEPTION_DUP_ANZ modify column CUSTOMSTRING1 set masking policy LANDING_PII.SF_CUSTOM_STRING;


alter table LANDING_PII.SFACTORS_EMPJOB_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table CURATED_PII.SFACTORS_EMPJOB_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table FINAL_PII.SFACTORS_FACT_EMPJOB_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table EXCPTN_PII.SFACTORS_EMPJOB_EXCEPTION_DUP_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;



alter table LANDING_PII.SFACTORS_USER_ANZ modify column TITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table CURATED_PII.SFACTORS_USER_ANZ modify column TITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table FINAL_PII.SFACTORS_FACT_USER_ANZ modify column TITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table EXCPTN_PII.SFACTORS_USER_EXCEPTION_DUP_ANZ modify column TITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;



alter table LANDING_PII.SFACTORS_USER_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table CURATED_PII.SFACTORS_USER_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table FINAL_PII.SFACTORS_FACT_USER_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table EXCPTN_PII.SFACTORS_USER_EXCEPTION_DUP_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;


alter table LANDING_PII.SFACTORS_USER_ANZ modify column DATEOFBIRTH set masking policy LANDING_PII.SF_DOB_DATE;
alter table CURATED_PII.SFACTORS_USER_ANZ modify column DATEOFBIRTH set masking policy LANDING_PII.SF_DOB_DATE;
alter table FINAL_PII.SFACTORS_FACT_USER_ANZ modify column DATEOFBIRTH set masking policy LANDING_PII.SF_DOB_DATE;
alter table EXCPTN_PII.SFACTORS_USER_EXCEPTION_DUP_ANZ modify column DATEOFBIRTH set masking policy LANDING_PII.SF_DOB_DATE;



alter table LANDING_PII.SFACTORS_POSITION_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table CURATED_PII.SFACTORS_POSITION_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table MASTER_PII.SFACTORS_DIM_POSITION_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;
alter table EXCPTN_PII.SFACTORS_POSITION_EXCEPTION_DUP_ANZ modify column JOBTITLE set masking policy LANDING_PII.SF_CUSTOM_STRING;

------------------------------------------------------------------------------------------------------------------------------------


