#!/bin/bash

hadoop fs -mkdir /user/admin
hadoop fs -chown admin:hadoop /user/admin
hadoop fs -mkdir /user/joe_analyst
hadoop fs -chown joe_analyst:hadoop /user/joe_analyst
hadoop fs -mkdir /user/kate_hr
hadoop fs -chown kate_hr:hadoop /user/kate_hr
hadoop fs -mkdir /user/sasha_eu_hr
hadoop fs -chown sasha_eu_hr:hadoop /user/sasha_eu_hr
hadoop fs -mkdir /user/ivanna_eu_hr
hadoop fs -chown ivanna_eu_hr:hadoop /user/ivanna_eu_hr
hadoop fs -mkdir /user/etl_user
hadoop fs -chown etl_user:hadoop /user/etl_user


hadoop fs -mkdir /user/john_finance
hadoop fs -chown john_finance:hadoop /user/john_finance
hadoop fs -mkdir /user/mark_bizdev
hadoop fs -chown mark_bdev:hadoop /user/mark_bizdev
hadoop fs -mkdir /user/jermy_contractor
hadoop fs -chown jermy_contractor:hadoop /user/jermy_contractor
hadoop fs -mkdir /user/diane_csr
hadoop fs -chown diane_csr:hadoop /user/diane_csr
hadoop fs -mkdir /user/log_monitor
hadoop fs -chown log_monitor:hadoop /user/log_monitor

echo "Copying data to /hive_data dir in HDFS..."
hdfs dfs -mkdir -p /hive_data/claim/
hdfs dfs -mkdir -p /hive_data/cost_savings/
hdfs dfs -mkdir -p /hive_data/finance/tax_2009/
hdfs dfs -mkdir -p /hive_data/finance/tax_2010/
hdfs dfs -mkdir -p /hive_data/finance/tax_2015/
hdfs dfs -mkdir -p /hive_data/hortoniabank/eu_countries/
hdfs dfs -mkdir -p /hive_data/hortoniabank/us_customers/
hdfs dfs -mkdir -p /hive_data/hortoniabank/ww_customers/
hdfs dfs -mkdir -p /hive_data/consent/
hdfs dfs -mkdir -p /hive_data/eu_countries/
hdfs dfs -mkdir -p /hive_data/hr/employees_raw/
hdfs dfs -mkdir -p /hive_data/hr/employees/


hdfs dfs -put data/claims_provider_summary_data.csv /hive_data/claim/
hdfs dfs -put data/claim-savings.csv                /hive_data/cost_savings/
hdfs dfs -put data/tax_2009.csv                     /hive_data/finance/tax_2009/
hdfs dfs -put data/tax_2010.csv                     /hive_data/finance/tax_2010/
hdfs dfs -put data/tax_2015.csv                     /hive_data/finance/tax_2015/
hdfs dfs -put data/eu_countries.csv                 /hive_data/hortoniabank/eu_countries/
hdfs dfs -put data/us_customers_data.csv            /hive_data/hortoniabank/us_customers/
hdfs dfs -put data/ww_customers_data.csv            /hive_data/hortoniabank/ww_customers/
hdfs dfs -put data/consent_master_data_cleaned.csv      /hive_data/consent/
hdfs dfs -put data/eu_countries.csv                     /hive_data/eu_countries/
hdfs dfs -put data/employees_raw.csv                /hive_data/hr/employees_raw/
hdfs dfs -put data/employees.csv                    /hive_data/hr/employees/


hdfs dfs -chown -R hive:hive /hive_data/
