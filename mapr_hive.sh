#!/bin/bash
###################################################################
#Script Name    :mapr_hive.sh
#Description    :Script contains alias and functions for frequent used commands with mapr datafabric
#Args           :
#Author         :Saikant Gajula
#Email          :gajulasaikant@gmail.com
###################################################################

MAPR_HOME=/opt/mapr
HIVE_VERSION=`cat $MAPR_HOME/hive/hiveversion`

#open hive-site.xml for editing
alias vihivesite='vi $MAPR_HOME/hive/hive-$HIVE_VERSION/conf/hive-site.xml'

#Open beeline session
alias open_beeline='hive --service beeline'

#Open Log Files
alias openhs2logs='less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-hiveserver2-`hostname -f`.log'
alias openmetalogs='less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-metastore-`hostname -f`.log'

#Changing directories
alias cdhivelogs='cd $MAPR_HOME/hive/hive-$HIVE_VERSION/logs'
alias cdhiveconf='cd $MAPR_HOME/hive/hive-$HIVE_VERSION/conf'

#Useful oneliners/commands.
####Get set -v from hive shell and save output to /tmp/hive/hive.set
get_set () {
	mkdir -p /tmp/hive/
	mv /tmp/hive/hive.set /tmp/hive/hive.set.prev.$$ > /dev/null 2>&1
	/usr/bin/hive -e "set -v;" > /tmp/hive/hive.set
	if [ $? -eq 0 ];then
		echo "SUCCESS:Output available at :/tmp/hive/hive.set"
	else
		echo "ERROR:Command failed. Please check error"
	fi
}
export -f  get_set

####Create sample hive table for testing
createhivetable () {
	export NAME=$(date +%Y%m%d%H%M%S)

	for i in `seq 1 100`;do
		echo "$i,mapr$i" >> /tmp/hive.testdata.$NAME
	done

	hive -e "create table mapr_test_$NAME (id int, name string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';LOAD DATA LOCAL INPATH '/tmp/hive.testdata.$NAME' OVERWRITE into table mapr_test_$NAME;select count (1) from mapr_test_$NAME;"

	if [ $? -ne 0 ];then
        echo "ERROR:Command failed.Please check error"
	else
        echo "Success:Command executed successfully"
	fi
}

export -f createhivetable



