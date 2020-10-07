#!/bin/bash
###################################################################
#Script Name    :mapr_yarn.sh
#Description    :Script contains alias and functions for frequent used commands with mapr datafabric
#Args           :
#Author         :Saikant Gajula
#Email          :gajulasaikant@gmail.com
###################################################################

#Set hadoop version details

MAPR_HOME=/opt/mapr
HADOOP_VERSION=`cat $MAPR_HOME/hadoop/hadoopversion`

#File Editors
alias viyarnsite='vi $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/yarn-site.xml'

#Log file open
alias openyarnlogs='less $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/logs/yarn-mapr-resourcemanager-*.log'

#Change directories.
alias cdhdlogs='cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/logs'
alias cdhdconf='cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop'

#Commands
alias activerm='maprcli urls -name resourcemanager'
alias containerassigment="grep -h SchedulerNode $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/logs/yarn-mapr-resourcemanager-*.log  | grep available | grep Assigned | sed 's/:..,.*//' | sort | uniq -c"

#Run sample jobs

alias runpijob='yarn jar $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/share/hadoop/mapreduce/hadoop-mapreduce-examples-$HADOOP_VERSION-mapr-*.jar pi  10 10'

alias runpijobdebug='yarn jar $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/share/hadoop/mapreduce/hadoop-mapreduce-examples-$HADOOP_VERSION-mapr-*.jar pi -Dfs.mapr.trace=DEBUG  10 10'

#application logs breakdown/analysis.
application_break () {
	application=$1
	dir=$application
	name=breakdown
	mkdir -p ${dir}_$name

	if [ $# -lt 1 ]; then
    	echo "ERROR:Usage:- application_break  <application id>"
    	return 2
	fi
	for i in `grep "Container: container_" $application  |  awk '{print $2}'`; do 
		sed -n "/Container: ${i}/,/Container: container_/p" $application  &>${dir}_$name/${i}.txt
		echo "$i done"
	done  
}

export -f application_break


#Enable Debugs
#Enable Scheduler debug.
alias scheduler_debug='yarn daemonlog -setlevel `activerm|grep -v url|cut -c9-` org.apache.hadoop.yarn.server.resourcemanager.scheduler DEBUG'

