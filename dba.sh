#!/bin/sh

ORACLE_SID=$1; export ORACLE_SID
ORATAB=/etc/oratab
ORACLE_HOME=`grep $ORACLE_SID: $ORATAB | cut -d':' -f2`
export ORACLE_HOME=/u01/app/oracle/product/11.2/db_1
export PATH=/u01/app/oracle/product/11.2/db_1/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/oracle/bin
export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2/db_1/lib:
export DB_LIST="WLIT MBXT CMST MBXTS WLTT"
export DB1=WLIT
export DB2=MBXT
export DB3=CMST
export DB4=MBXTS
export DB5=WLTT

DBATEAM="francis.ndangum@newrez.com"
SENDID="NoReply@NewRez.com"
RECVID="$DBATEAM"

cd /export/home/oracle/scripts
logfile=/home/oracle/scripts/log_shipment_sync_report.log
cnt1=`ps -ef|grep pmon|grep $DB*|wc -l`

for DB in $DB_LIST;
do
"[ $cnt1 -eq 1 ];";
done
if "$cnt1 -eq 1" true
then
sqlplus -s "/as sysdba" > /dev/null << EOF
spool $logfile
@/home/oracle/scripts/log_shipment_sync_report.sql
spool off
exit
EOF
# If there are more then these two lines in the output file, mail it.
count=`cat $logfile|wc -l`
#echo $count
if [ $count -ge 4 ];
then
mailx -s "LOG SHIPMENT SYNC for On Prem Test DB " francis.ndangum@newrez.com <$logfile
fi
fi
