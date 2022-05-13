 #!/bin/bash

kinit -kt /run/cloudera-scm-agent/process/83-hdfs-NAMENODE-nnRpcWait/hdfs.keytab hdfs/`hostname -f`@SQUADRON.SUPPORT.HORTONWORKS.COM
hadoop fs -chmod 777 /user
export WKDIR=/tmp
 hadoop fs -mkdir -p /user/admin
 hadoop fs -chown admin:hadoop /user/admin
 hadoop fs -mkdir -p /user/joe_analyst
 hadoop fs -chown joe_analyst:hadoop /user/joe_analyst
 hadoop fs -mkdir -p /user/kate_hr
 hadoop fs -chown kate_hr:hadoop /user/kate_hr
 hadoop fs -mkdir -p /user/sasha_eu_hr
 hadoop fs -chown sasha_eu_hr:hadoop /user/sasha_eu_hr
 hadoop fs -mkdir -p /user/ivanna_eu_hr
 hadoop fs -chown ivanna_eu_hr:hadoop /user/ivanna_eu_hr
 hadoop fs -mkdir -p /user/etl_user
 hadoop fs -chown etl_user:hadoop /user/etl_user
 hadoop fs -mkdir -p /user/john_finance
 hadoop fs -chown john_finance:hadoop /user/john_finance
 hadoop fs -mkdir -p /user/mark_bizdev
 hadoop fs -chown mark_bdev:hadoop /user/mark_bizdev
 hadoop fs -mkdir -p /user/jermy_contractor
 hadoop fs -chown jermy_contractor:hadoop /user/jermy_contractor
 hadoop fs -mkdir -p /user/diane_csr
 hadoop fs -chown diane_csr:hadoop /user/diane_csr
 hadoop fs -mkdir -p /user/log_monitor
 hadoop fs -chown log_monitor:hadoop /user/log_monitor


echo "Cleaning up hive_data"
 hdfs dfs -rm -r -f /hive_data/*

echo "Copying data to /hive_data dir in HDFS..."
 hdfs dfs -mkdir -p /hive_data/claim/
 hdfs dfs -mkdir -p /hive_data/cost_savings/
 hdfs dfs -mkdir -p /hive_data/finance/tax_2009/
 hdfs dfs -mkdir -p /hive_data/finance/tax_2010/
 hdfs dfs -mkdir -p /hive_data/finance/tax_2015/
 hdfs dfs -mkdir -p /hive_data/worldwidebank/eu_countries/
 hdfs dfs -mkdir -p /hive_data/worldwidebank/us_customers/
 hdfs dfs -mkdir -p /hive_data/worldwidebank/ww_customers/
 hdfs dfs -mkdir -p /hive_data/consent/
 hdfs dfs -mkdir -p /hive_data/eu_countries/
 hdfs dfs -mkdir -p /hive_data/hr/employees_raw/
 hdfs dfs -mkdir -p /hive_data/hr/employees/

cd $WKDIR
rm -rf CDP-SaaS-masterclass
git clone https://github.com/manojsundaram/CDP-SaaS-masterclass

 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/claims_provider_summary_data.csv /hive_data/claim/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/claim-savings.csv                /hive_data/cost_savings/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2009.csv                     /hive_data/finance/tax_2009/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2010.csv                     /hive_data/finance/tax_2010/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/tax_2015.csv                     /hive_data/finance/tax_2015/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/eu_countries.csv                 /hive_data/worldwidebank/eu_countries/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/us_customers_data.csv            /hive_data/worldwidebank/us_customers/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/ww_customers_data.csv            /hive_data/worldwidebank/ww_customers/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/consent_master_data_cleaned.csv      /hive_data/consent/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/eu_countries.csv                     /hive_data/eu_countries/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/employees_raw.csv                /hive_data/hr/employees_raw/
 hdfs dfs -put $WKDIR/CDP-SaaS-masterclass/data/employees.csv                    /hive_data/hr/employees/
 hdfs dfs -chown -R hive:hive /hive_data/
