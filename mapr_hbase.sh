#!/bin/bash

#Global Variables
MAPR_HOME=/opt/mapr
HBASE_VERSION=`cat $MAPR_HOME/hbase/hbaseversion`

#Change directories
alias cdhbaselogs='cd $MAPR_HOME/hbase/hbase-$HBASE_VERSION/logs'

#Open log files
alias openhbasemasterlog='less $MAPR_HOME/hbase/hbase-${HBASE_VERSION}/logs/hbase-mapr-master-`hostname -f`.log'
alias openhbaseregionlog='less $MAPR_HOME/hbase/hbase-${HBASE_VERSION}/logs/hbase-mapr-regionserver-`hostname -f`.log'

#File Editors
alias vihbasesite='vi $MAPR_HOME/hbase/hbase-$HASE_VERSION/hbase-site.xml'

#Useful oneliners/commands
#Shutdown hbase completely on all nodes(master,regionservers).
shutdown_hbase () {
	$MAPR_HOME/bin/maprcli node services -hbregionserver stop -filter [svc=="hbregionserver"]
	$MAPR_HOME/bin/maprcli node services -hbmaster stop -filter [svc=="hbmaster"]
}

export -f shutdown_hbase

#Start hbase completely on all nodes(master,regionservers).
start_hbase () {
	$MAPR_HOME/bin/maprcli node services -hbregionserver start -filter [csvc=="hbregionserver"]
	$MAPR_HOME/bin/maprcli node services -hbmaster start -filter [csvc=="hbmaster"]
}

export -f start_hbase

#Get hbase status detail and produce output file /tmp/hbase/hbase.status.out

hbasestatusdetailed () {
	mkdir -p /tmp/hbase
	mv /tmp/hbase/hbase.status.out /tmp/hbase/hbase.status.out.prev.$$ >/dev/null 2>&1
	echo "status 'detailed'"| hbase shell > /tmp/hbase/hbase.status.out
	echo "Output file location: /tmp/hbase/hbase.status.out"
}

export -f hbasestatusdetailed

#Get hbase meta table details and print output file to /tmp/hbase/scan.meta

hbasescanmeta () {
	mkdir -p /tmp/hbase
	mv /tmp/hbase/scan.meta /tmp/hbase/scan.meta.prev.$$ > /dev/null 2>&1
	echo "scan 'hbase:meta'" | hbase shell > /tmp/hbase/scan.meta
	echo "Output file location: /tmp/hbase/scan.meta"
}

export -f hbasescanmeta
