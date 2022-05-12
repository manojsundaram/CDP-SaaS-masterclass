 #!/bin/bash

export WKDIR=/tmp
sudo -u hdfs hadoop fs -mkdir /user/admin
sudo -u hdfs hadoop fs -chown admin:hadoop /user/admin
sudo -u hdfs hadoop fs -mkdir /user/joe_analyst
sudo -u hdfs hadoop fs -chown joe_analyst:hadoop /user/joe_analyst
sudo -u hdfs hadoop fs -mkdir /user/kate_hr
sudo -u hdfs hadoop fs -chown kate_hr:hadoop /user/kate_hr
sudo -u hdfs hadoop fs -mkdir /user/sasha_eu_hr
sudo -u hdfs hadoop fs -chown sasha_eu_hr:hadoop /user/sasha_eu_hr
sudo -u hdfs hadoop fs -mkdir /user/ivanna_eu_hr
sudo -u hdfs hadoop fs -chown ivanna_eu_hr:hadoop /user/ivanna_eu_hr
sudo -u hdfs hadoop fs -mkdir /user/etl_user
sudo -u hdfs hadoop fs -chown etl_user:hadoop /user/etl_user
sudo -u hdfs hadoop fs -mkdir /user/john_finance
sudo -u hdfs hadoop fs -chown john_finance:hadoop /user/john_finance
sudo -u hdfs hadoop fs -mkdir /user/mark_bizdev
sudo -u hdfs hadoop fs -chown mark_bdev:hadoop /user/mark_bizdev
sudo -u hdfs hadoop fs -mkdir /user/jermy_contractor
sudo -u hdfs hadoop fs -chown jermy_contractor:hadoop /user/jermy_contractor
sudo -u hdfs hadoop fs -mkdir /user/diane_csr
sudo -u hdfs hadoop fs -chown diane_csr:hadoop /user/diane_csr
sudo -u hdfs hadoop fs -mkdir /user/log_monitor
sudo -u hdfs hadoop fs -chown log_monitor:hadoop /user/log_monitor

echo "Copying data to /hive_data dir in HDFS..."
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/claim/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/cost_savings/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/finance/tax_2009/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/finance/tax_2010/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/finance/tax_2015/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/hortoniabank/eu_countries/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/hortoniabank/us_customers/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/hortoniabank/ww_customers/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/consent/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/eu_countries/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/hr/employees_raw/
sudo -u hdfs hdfs dfs -mkdir -p /hive_data/hr/employees/

cd $WKDIR
git clone https://github.com/manojsundaram/CDP-SaaS-masterclass
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/claims_provider_summary_data.csv /hive_data/claim/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/claim-savings.csv                /hive_data/cost_savings/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2009.csv                     /hive_data/finance/tax_2009/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2010.csv                     /hive_data/finance/tax_2010/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2015.csv                     /hive_data/finance/tax_2015/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/eu_countries.csv                 /hive_data/hortoniabank/eu_countries/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/us_customers_data.csv            /hive_data/hortoniabank/us_customers/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/ww_customers_data.csv            /hive_data/hortoniabank/ww_customers/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/consent_master_data_cleaned.csv      /hive_data/consent/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/eu_countries.csv                     /hive_data/eu_countries/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/employees_raw.csv                /hive_data/hr/employees_raw/
sudo -u hdfs hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/employees.csv                    /hive_data/hr/employees/
sudo -u hdfs hdfs dfs -chown -R hive:hive /hive_data/
