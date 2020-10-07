#!/bin/bash
###################################################################
#Script Name    :mapr_core.sh
#Description    :Script contains alias and functions for frequent used commands with mapr datafabric
#Args           :
#Author         :Saikant Gajula
#Email          :gajulasaikant@gmail.com
###################################################################

####Global Variables
MAPR_HOME=/opt/mapr
HADOOP_VERSION=`cat $MAPR_HOME/hadoop/hadoopversion`


####MapR PATH
PATH=$PATH:$MAPR_HOME/server/

#Linux commands
alias tailf='tail -f'
alias c='clear'
alias grep='grep -n --color'
alias listports='netstat -plant'
alias meminfo='free -m -l -t'



#MapR Command shortcuts
alias svc='maprcli node list -columns svc'
alias csvc='maprcli node list -columns csvc'
alias master='maprcli node cldbmaster'
alias cldbuptime='maprcli dump cldbstate'
alias listcldbs='maprcli node listcldbs'
alias listzookeepers='maprcli node listzookeepers'
alias zqstatus='$MAPR_HOME/initscripts/zookeeper qstatus'

#SSL related 
alias list_keystore='keytool -list -keystore $MAPR_HOME/conf/ssl_keystore'

#Alarms and Licese
alias alarms='maprcli alarm list'
alias license='maprcli license list -json'

#Service start and stop
alias wrestart='service mapr-warden restart'
alias zrestart='service mapr-zookeeper restart'
alias wstop='service mapr-warden stop'
alias wstart='service mapr-warden start'
alias zstop='service mapr-zookeeper stop'
alias zstart='service mapr-zookeerp start'
alias fullrestart='service mapr-warden stop;service mapr-zookeeper stop;service mapr-zookeeper start;service mapr-warden start'
alias fullstop='service mapr-warden stop;service mapr-zookeeper stop'
alias fullstart='service mapr-zookeeper start;service mapr-warden start'

#Volume and Container related
alias vdump='maprcli dump volumeinfo -volumename'
alias cdump='maprcli dump containerinfo -ids'
alias vinfo='maprcli volume info -name'

#Mrconfig commands
alias spv='$MAPR_HOME/server/mrconfig sp list -v'
alias ithreads='$MAPR_HOME/server/mrconfig info threads'
alias islab='$MAPR_HOME/server/mrconfig info slabs'
alias dbthreads='$MAPR_HOME/server/mrconfig dbinfo threads'

#Mapr ticket's
alias usemaprticket='export MAPR_TICKETFILE_LOCATION=$MAPR_HOME/conf/mapruserticket'
alias mlogin='maprlogin password'


#Useful oneline scripts/commands.

alias top20containers='$MAPR_HOME/server/mrconfig info dumpcontainers |awk '\''{print $1,$2,$3,$7,$16}'\'' |sort -t: -n -r -k  5 |head  -20'
alias volumemounts='maprcli volume list -columns n,mountdir,mounted'

mfstop () {
	PID=`pidof mfs`
	top -p $PID -H
}
export -f mfstop

getmep () {
	grep MEP /etc/yum.repos.d/*|grep -v "#"|awk -F '/' '{print $(NF-1)}'
}
export -f getmep

#Find container status/pretty print

findcontainers () {
	VOLUME_NAME=$1
	maprcli  dump volumeinfo -volumename  $VOLUME_NAME -json|grep -v Creator |egrep 'ContainerId|Epoch|Master|--|RESYN'
}
export -f findcontainers

#Find all volume space used.
alias mapr_totalspace='maprcli volume list  -columns aen,n,tsu,used,dlu,drf,snapshotused'

####Change directories
alias cdmfslogs='cd $MAPR_HOME/logs'


####File Editors
alias vicoresite='vi $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml'

####Open Log Files
alias opencldblogs='less $MAPR_HOME/logs/cldb.log'
alias openmfslog3='less $MAPR_HOME/logs/mfs.log-3'
alias openmfslog5='less $MAPR_HOME/logs/mfs.log-5'

####For file backup
filebackup () {
    if [ $# -lt 1 ]; then
        echo "ERROR:Usage:- filebackup <filename>"
        return 2
    fi
    for f in "$@"
        do cp -a "$f" "$f".$(date +%Y%m%d%H%M)
    done
}

export -f filebackup



####MapR Service Restarts
service_action () {
	SERVICE=$1
	ACTION=$2
	HOST=$3
	maprcli node services -name $SERVICE -action $ACTION -nodes $HOST
}

export -f service_action



#Maprcli config save
maprcliconfig_save () {
	KEY=$1
	VALUE=$2

	if [ $# -lt 2 ]; then
        echo "ERROR:Usage:- maprcliconfig_save <key> <value>"
    	return 2
	fi
	echo "Current value is below"
	maprcli config load -json |grep "$KEY"

	maprcli config save -values '{'"$KEY"':'"$VALUE"'}'

	if [ $? -ne 0 ];then
        echo "ERROR:Command failed. Please check error"
	else
        echo "Success:Command completed successfully"
	fi
	echo "Value updated as below"
    maprcli config load -json|grep "$KEY"
}
export -f maprcliconfig_save


#####Enable core debug
enablecoredebug () {
	CORESITE_XML=$MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml
	if [ $? -eq 0 ];then
        cp $CORESITE_XML /tmp/core-site.xml.`date '+%Y%m%d%H%M%S'`
	else
        echo "Taking backup of core-site.xml failed.Please fix above error"
        return 2
	fi
cat <<EOF >/tmp/core.site.tmp
<property>
<name>fs.mapr.trace</name>
<value>DEBUG</value>
</property>
EOF

	sed '/<\/configuration>/e cat /tmp/core.site.tmp' $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml |tee /tmp/debug-core-site.xml
	echo "yes"| mv /tmp/debug-core-site.xml $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml

}
export -f enablecoredebug

take_gstack () {
	/usr/bin/which gstack > /dev/null 2>&1
	if [ $? -ne 0 ];then
        echo "Error:gstack command not available. Please install gdb package 'yum install gdb'  "
        return 1
	fi

	if [ $# -lt 2 ];then
        echo "ERROR:Usage:- take_gstack <Number of gstack to be taken> <PID of Process> <sleep duration>"
        return 1
	fi

	NUMBER=$1
	PID=$2
	SLEEP_DURATION=$3
	SUPPORT_LOCATION=/tmp

	mkdir -p $SUPPORT_LOCATION/gstack/gstack_$PID/

	if [ "$(ls -A $SUPPORT_LOCATION/gstack/gstack_$PID/)" ]; then
		echo "Ouput directory is not Empty.Moving previous data to folder $SUPPORT_LOCATION/gstack/gstack_$PID/previous_output.$$"
     	mkdir -p $SUPPORT_LOCATION/gstack/gstack_$PID/previous_output.$$
     	mv $SUPPORT_LOCATION/gstack/gstack_$PID/* $SUPPORT_LOCATION/gstack/gstack_$PID/previous_output.$$/ > /dev/null 2>&1
	else
   	    echo "Good output directory is empty"
	fi

	for i in `seq 1 $NUMBER`;do
    	gstack  $PID > $SUPPORT_LOCATION/gstack/gstack_$PID/gstack.$PID.$i
    	echo "$i:Written output to $SUPPORT_LOCATION/gstack/gstack_$PID/gstack.$PID.$i  .Sleeping for $SLEEP_DURATION secs"
    	sleep $SLEEP_DURATION
	done
}

export -f take_gstack
