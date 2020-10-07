#!/bin/bash
###################################################################
#Script Name    :jvm_debug.sh
#Description    :Script contains alias and functions for frequent used commands for java process debugging. 
#Args           :
#Author         :Saikant Gajula
#Email          :gajulasaikant@gmail.com
###################################################################

#Global Variables
HADOOP_VERSION=`cat /opt/mapr/hadoop/hadoopversion`
HIVE_VERSION=`cat /opt/mapr/hive/hiveversion`
HBASE_VERSION=`cat /opt/mapr/hbase/hbaseversion`
SPARK_VERSION=`cat /opt/mapr/spark/sparkversion`


take_jstat () {
	/usr/bin/which jstat > /dev/null 2>&1
	if [ $? -ne 0 ];then
        echo "ERROR:jstat command not available. Please install java-*jdk-devel Package or see if java_home path is set correctly"
		return 2
	fi

	if [ $# -lt 2 ]; then
        echo "ERROR:Usage:- take_jstat  <PID of Process> <sleep interval in milli-secs> <Number of samples>"
	return 2
	fi

	PID=$1
	SLEEP_DURATION=$2
	NUMBER=$3
	SUPPORT_LOCATION=/tmp
	mkdir -p $SUPPORT_LOCATION/jstat/jstat_$PID/

	if [ "$(ls -A $SUPPORT_LOCATION/jstat/jstat_$PID/)" ]; then
		echo "Ouput directory is not Empty.Moving previous data to folder $SUPPORT_LOCATION/jstat/jstat_$PID/previous_output.$$"
     	mkdir -p $SUPPORT_LOCATION/jstat/jstat_$PID/previous_output.$$
     	mv $SUPPORT_LOCATION/jstat/jstat_$PID/* $SUPPORT_LOCATION/jstat/jstat_$PID/previous_output.$$/ > /dev/null 2>&1
	else
   		echo "Good output directory is empty"
	fi

	jstat -gcutil $PID  $SLEEP_DURATION $NUMBER  |tee -a $SUPPORT_LOCATION/jstat/jstat_$PID/jstat.$PID
	echo "Output written to file $SUPPORT_LOCATION/jstat/jstat_$PID/jstat.$PID"
}

export -f take_jstat

take_jstack () {
	/usr/bin/which jstack > /dev/null 2>&1
	if [ $? -ne 0 ];then
        echo "Error:jstack command not available. Please install java-*jdk-devel Package or see if java_home path is set correctly"
	return 2
	fi

	if [ $# -lt 2 ]; then
        echo "ERROR:Usage:- take_jstack <Number of jstack to be taken> <PID of Process> <sleep duration>"
	return 2
	fi


	NUMBER=$1
	PID=$2
	SLEEP_DURATION=$3
	SUPPORT_LOCATION=/tmp
	mkdir -p $SUPPORT_LOCATION/jstack/jstack_$PID/

	if [ "$(ls -A $SUPPORT_LOCATION/jstack/jstack_$PID/)" ]; then
   		echo "Ouput directory is not Empty.Moving previous data to folder $SUPPORT_LOCATION/jstack/jstack_$PID/previous_output.$$"
     	mkdir -p $SUPPORT_LOCATION/jstack/jstack_$PID/previous_output.$$
    	mv $SUPPORT_LOCATION/jstack/jstack_$PID/* $SUPPORT_LOCATION/jstack/jstack_$PID/previous_output.$$/ > /dev/null 2>&1
	else
    	echo "Good output directory is empty"
	fi

	for i in `seq 1 $NUMBER`;do
		jstack -l $PID > $SUPPORT_LOCATION/jstack/jstack_$PID/jstack.$PID.$i
		echo "$i:Written output to $SUPPORT_LOCATION/jstack/jstack_$PID/jstack.$PID.$i  .Sleeping for $SLEEP_DURATION secs"
		sleep $SLEEP_DURATION
	done
}
export -f take_jstack


take_heapdump () {
	/usr/bin/which jmap > /dev/null 2>&1
	if [ $? -ne 0 ];then
        echo "ERROR:jmap command not available. Please install java-*jdk-devel Package or see if java_home path is set correctly"
		return 2
	fi

	read -r -p "Please ensure you have sufficient space in output directory?.Please confirm [Y/n]" response
	response=${response,,} # tolower
	if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        echo "You selected yes, so continuing"
	else
        echo "You selected "No". So terminating command"
        return 2
	fi

	OUTPUT_LOCATION=$1
	PID=$2
	mkdir -p $OUTPUT_LOCATION/jmap/jmap_$PID/

	if [ "$(ls -A $OUTPUT_LOCATION/jmap/jmap_$PID)" ]; then
		echo "Ouput directory is not Empty.Moving previous data to folder $OUTPUT_LOCATION/jmap/jmap_${PID}_previous_output"
     	mkdir -p $OUTPUT_LOCATION/jmap/jmap_${PID}_previous_output
     	mv $OUTPUT_LOCATION/jmap/jmap_$PID/* $OUTPUT_LOCATION/jmap/jmap_${PID}_previous_output/heap.dump.$(date +%Y%m%d%H%M) # > /dev/null 2>&1
    	echo  "mv $OUTPUT_LOCATION/jmap/jmap_$PID/* $OUTPUT_LOCATION/jmap/jmap_${PID}_previous_output/heapdump.$(date +%Y%m%d%H%M)"
	else
   		 echo "Good output directory is empty"
	fi

	jmap -dump:format=b,file=$OUTPUT_LOCATION/jmap/jmap_$PID/$PID.hprof $PID

	if [ $? -eq 0 ];then
        echo "Success:Command executed successfully"
        echo "Outputfile location : $OUTPUT_LOCATION/jmap/jmap_$PID/$PID.hprof"
        echo "Dump size is: `du -sh $OUTPUT_LOCATION/jmap/jmap_$PID/$PID.hprof`"
	else
        echo "ERROR:Command failed. Please check error"
	fi
}
export -f take_heapdump


