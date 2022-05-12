 #!/bin/bash

export WKDIR=/tmp
export kdc_realm=SQUADRON.SUPPORT.HORTONWORKS.COM
export beeline_url="jdbc:hive2://localhost:10000/default;principal=hive/$(hostname -f)@${kdc_realm}"

kinit -kt /run/cloudera-scm-agent/process/93-hive-HIVEMETASTORE/hive.keytab hive/`hostname -f`@$kdc_realm
cd $WKDIR
rm -rf $WKDIR/CDP-SaaS-masterclass

git clone https://github.com/manojsundaram/CDP-SaaS-masterclass

beeline -u ${beeline_url} -f $WKDIR/CDP-SaaS-masterclass/data/dropall_db.hsql
beeline -u ${beeline_url} -f $WKDIR/CDP-SaaS-masterclass/data/HiveSchema.hsql

if [ "${enable_hive_acid}" = true  ]; then
  beeline -u ${beeline_url} -n hive -f $WKDIR/CDP-SaaS-masterclass/data/TransSchema.hsql
fi
