# Mapr-alias

*[tailf]-  tail -f
*[c]-  clear
*[grep]-  grep -n --color
*[svc]-  maprcli node list -columns svc
*[csvc]-  maprcli node list -columns csvc
*[master]-  maprcli node cldbmaster
*[cldbuptime]-  maprcli dump cldbstate
*[listcldbs]-  maprcli node listcldbs
*[listzookeepers]-  maprcli node listzookeepers
*[zqstatus]-  $MAPR_HOME/initscripts/zookeeper qstatus
*[alarms]-  maprcli alarm list
*[license]-  maprcli license list -json
*[wrestart]-  service mapr-warden restart
*[zrestart]-  service mapr-zookeeper restart
*[wstop]-  service mapr-warden stop
*[wstart]-  service mapr-warden start
*[zstop]-  service mapr-zookeeper stop
*[zstart]-  service mapr-zookeerp start
*[fullrestart]-  service mapr-warden stop;service mapr-zookeeper stop;service mapr-zookeeper start;service mapr-warden start
*[fullstop]-  service mapr-warden stop;service mapr-zookeeper stop
*[vdump]-  maprcli dump volumeinfo -volumename
*[cdump]-  maprcli dump containerinfo -ids
*[vinfo]-  maprcli volume info -name
*[spv]-  $MAPR_HOME/server/mrconfig sp list -v
*[ithreads]-  $MAPR_HOME/server/mrconfig info threads
*[islab]-  $MAPR_HOME/server/mrconfig info slabs
*[dbthreads]-  $MAPR_HOME/server/mrconfig dbinfo threads
*[usemaprticket]-  export MAPR_TICKETFILE_LOCATION]-  $MAPR_HOME/conf/mapruserticket
*[mlogin]-  maprlogin password
*[top20containers]-  Gets top 20 containers from mrconfig info dumpcontainers output
*[mfstop]-   Runs top -p <mfspid> -H
*[getmep]-  Gets MAPR Ecosystem release version.
*[mapr_totalspace]-  Runs maprcli volume list  -columns aen,n,tsu,used,dlu,drf,snapshotused
*[cdmfslogs]-  'cd $MAPR_HOME/logs'
*[vicoresite]-  'vi $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml'
*[opencldblogs]-  'less $MAPR_HOME/logs/cldb.log'
*[openmfslog3]-  'less $MAPR_HOME/logs/mfs.log-3'
*[openmfslog5]-  'less $MAPR_HOME/logs/mfs.log-5'
*[maprbackup]-   Backups file provided at same location as source with date +%Y%m%d%H%M timestamp.
*[maprcliconfig_save]-  maprcli config save -values '{'"$KEY"':'"$VALUE"'}'
*[enablecoredebug]-  Add's fs.mapr.trace]-  TRACE in core-site.xml
*[take_gstack]-  Takes gstack of C process.
*[vihivesite]-  Opens hive-site.xml in vi mode.
*[open_beeline]-  Runs hive --service beeline
*[openhs2logs]-  Runs less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-hiveserver2-`hostname -f`.log
*[alias openmetalogs]-  Runs less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-metastore-`hostname -f`.log
*[cdhivelogs]-  Change working dir to $MAPR_HOME/hive/hive-$HIVE_VERSION/logs
*[cdhiveconf]-  Change working dir to cd $MAPR_HOME/hive/hive-$HIVE_VERSION/conf
*[get_set]-  Gets set -v output from hive shell and stores it in /tmp/hive/hive.set
*[createhivetable]-  Creates a hive table with name  mapr_test_$(date +%Y%m%d%H%M%S) and loads it with sample data of 100 rows.
*[cdhbaselogs]-  Runs cd $MAPR_HOME/hbase/hbase-$HBASE_VERSION/logs
*[vihbasesite]-  vi $MAPR_HOME/hbase/hbase-$HASE_VERSION/hbase-site.xml
*[shutdown_hbase]-  Completely shutodown hbase servcies i.e hbase regionserver and master services.
*[start_hbase]-  Start hbase services on all configure master nodes
*[hbasestatusdetailed]-  Gets status 'detailed' output from hbase shell and stores it in /tmp/hbase/hbase.status.out
*[hbasescanmeta]-  Scan's hbase meta table and stores output in /tmp/hbase/scan.meta
*[viyarnsite]-   Open yarn-site.xml in vi mode.
*[openyarnlogs]-  Open yarn resource manager logs in less.
*[cdhdlogs]-  cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/logs
*[cdhdconf]-  cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop
*[activerm]-  Runs maprcli urls -name resourcemanager
*[containerassigment]-  Gets Resourcemanager container assignment speed per mins
*[runpijob]-  Runs yarn pi job with 10 samples
*[runpijobdebug]-   Runs yarn pi job in mapr filesystem debug mode with 10 samples
*[application_break]-  Breaks application logs in each container file with container name.
*[scheduler_debug]-  Enables yarn scheduler debug.
