 #!/bin/bash

export WKDIR=/tmp
export beeline_url="jdbc:hive2://localhost:10000"

cd $WKDIR

beeline -u ${beeline_url} -n hive -f $WKDIR/data/HiveSchema.hsql

if [ "${enable_hive_acid}" = true  ]; then
  beeline -u ${beeline_url} -n hive -f $WKDIRdata/TransSchema.hsql
fi
