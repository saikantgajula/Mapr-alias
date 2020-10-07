# Project Name:- MapR Alias and Functions
## Author:- Saikant Gajula
## Email:- gajulasaikant@gmail.com
#### Purpose:-
Working from command line is really fun and convinient  but remembering all commands and syntax is difficult for even a very experienced engineer.Specially if you have commands which are pretty long and have similar names. 
With increasing adoption of distributed systems, an engineer is supposed to work on multiple systems with complex technologies which are integrated tightly.

This project aims to create  alias and functions for frequent used commands with MAPR DATAFABRIC, which makes life easier for engineers to work.

##### How to use.
From unix shell as user with appropriate access run below command.

Install Github Cli if not available.
```sh
[root@8vm1 ~]# sudo dnf install git -y
```

Clone repository on mapr node.
```sh
[root@8vm1 ~] cd /opt/mapr/support/tools/
[root@8vm1 ~]git repo clone saikantgajula/Mapr-alias
[root@8vm1 ~]DOWNLOAD_DIR=/opt/mapr/support/tools/Mapr-alias
```
OR

You can download repo directly via wget
```sh
[root@8vm1 ~] cd /opt/mapr/support/tools/
[root@8vm1 ~]DOWNLOAD_DIR=/opt/mapr/support/tools/Mapr-alias
[root@8vm1 tools]# wget https://github.com/saikantgajula/Mapr-alias/archive/master.zip
--2020-10-07 12:30:49--  https://github.com/saikantgajula/Mapr-alias/archive/master.zip
Resolving github.com (github.com)... 140.82.113.4
Connecting to github.com (github.com)|140.82.113.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/saikantgajula/Mapr-alias/zip/master [following]
--2020-10-07 12:30:50--  https://codeload.github.com/saikantgajula/Mapr-alias/zip/master
Resolving codeload.github.com (codeload.github.com)... 140.82.113.9
Connecting to codeload.github.com (codeload.github.com)|140.82.113.9|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/zip]
Saving to: ‘master.zip’

master.zip                                            [ <=>                                                                                                         ]   9.05K  --.-KB/s    in 0s

2020-10-07 12:30:50 (34.2 MB/s) - ‘master.zip’ saved [9268]

[root@8vm1 tools]# unzip master.zip
Archive:  master.zip
0cc96e896a1b5352c6d52e61a1bd6b9c7e481f2a
   creating: Mapr-alias-master/
  inflating: Mapr-alias-master/README.md
 extracting: Mapr-alias-master/test
[root@8vm1 tools]# ls -lrt
total 156
-rwxr-xr-x 1 root root 13410 Sep 16 13:19 verifySum.sh
-rwxr-xr-x 1 root root  4080 Sep 16 13:19 utils.sh
-rwxr-xr-x 1 root root 57531 Sep 16 13:19 mapr-support-dump.sh
-rwxr-xr-x 1 root root 35668 Sep 16 13:19 mapr-support-collect.sh
-rw-r--r-- 1 root root  2722 Sep 16 13:19 HFileFix.java
-rwxr-xr-x 1 root root   596 Sep 16 13:19 gen_versions.sh
-rw-r--r-- 1 root root  4725 Sep 16 13:19 delete_region.rb
-rw-r--r-- 1 root root  5316 Sep 16 13:19 check_meta.rb
-rw-r--r-- 1 root root  2809 Sep 16 13:19 add_region.rb
drwxr-xr-x 2 root root   179 Sep 25 16:32 syscheck
drwxr-xr-x 2 root root    79 Sep 29 12:34 support_macros
drwxr-xr-x 2 root root    35 Oct  7 12:26 Mapr-alias-master
-rw-r--r-- 1 root root  9268 Oct  7 12:30 master.zip
[root@8vm1 tools]# mv Mapr-alias-master/ Mapr-alias
```





*	MapR Core
```sh
$ source $DOWNLOAD_DIR/mapr_core.sh
```
* YARN
```sh
$ source  $DOWNLOAD_DIR/mapr_yarn.sh
```
* Hive
```sh
$ source  $DOWNLOAD_DIR/mapr_hive.sh
```
* Hbase
```sh
$ source  $DOWNLOAD_DIR/mapr_hbase.sh
```
* Spark
```sh
$ source  $DOWNLOAD_DIR/mapr_spark.sh
```


## Mapr Core

```sh
$ source $DOWNLOAD_DIR/mapr_core.sh
```
###### Linux helpful commands
- tailf=tail -f
- c=clear
- grep=grep -n --color
- alias listports='netstat -plant'
- alias meminfo='free -m -l -t'

###### Maprcli Display/list commands
- svc=maprcli node list -columns svc
##### Example:-
```sh
[mapr@8vm1 ~]$ svc
hostname          service                                                                                                                                     ip
8vm1.example.com  spark-historyserver,hs2,cldb,hoststats,hivemeta,resourcemanager,historyserver,hbmaster,fileserver,hbregionserver,nfs,nodemanager,apiserver  10.10.73.43
[mapr@8vm1 ~]$
```
- csvc=maprcli node list -columns csvc
##### Example:-
```sh
[mapr@8vm1 ~]$ csvc
hostname          ip           configuredservice
8vm1.example.com  10.10.73.43  spark-historyserver,hs2,cldb,hoststats,hivemeta,resourcemanager,historyserver,hbmaster,fileserver,hbregionserver,nfs,nodemanager,apiserver
[mapr@8vm1 ~]$
```
- master=maprcli node cldbmaster
##### Example:-
```sh
[mapr@8vm1 ~]$ master
cldbmaster
ServerID: 1381100297754224768 HostName: 8vm1.example.com
[mapr@8vm1 ~]$
```
- cldbuptime=maprcli dump cldbstate
##### Example:- This works only with MapR 6.2
```sh
[mapr@8vm1 ~]$ cldbuptime
mode               ip           state                      stateDuration  desc
MASTER_READ_WRITE  10.10.73.43  CLDB_IS_MASTER_READ_WRITE  20:50:22       kvstore tables loading complete, cldb running as master
[mapr@8vm1 ~]$

```
- listcldbs=maprcli node listcldbs
##### Example:-
```sh
[mapr@8vm1 ~]$ listcldbs
CLDBs
8vm1.example.com
[mapr@8vm1 ~]$

```
- listzookeepers=maprcli node listzookeepers
##### Example:-
```sh
[mapr@8vm1 ~]$ listzookeepers
Zookeepers
8vm1.example.com:5181
[mapr@8vm1 ~]$
```
- zqstatus=$MAPR_HOME/initscripts/zookeeper qstatus
##### Example:-
```sh
[mapr@8vm1 ~]$ zqstatus
Using config: /opt/mapr/zookeeper/zookeeper-3.5.6/conf/zoo.cfg
Client port found: 5181. Client address: localhost.
Mode: standalone
[mapr@8vm1 ~]$
```
- alarms=maprcli alarm list
##### Example:-
```sh
[mapr@8vm1 ~]$ alarms
alarm statechange time  alarm state  description                                                  alarm group             alarm name                             entity
1601928226620           1            One or more licenses is about to expire within 18 days       cldb.alarm.group.warn   CLUSTER_ALARM_LICENSE_NEAR_EXPIRATION  CLUSTER
1601890369711           1            Node has core file(s). Look into /opt/cores for core files.  cldb.alarm.group.error  NODE_ALARM_CORE_PRESENT                8vm1.example.com
```
- license=maprcli license list -json
##### Example:- Output is truncated to save space.
```sh
[mapr@8vm1 ~]$ license
{
        "timestamp":1601965521870,
        "timeofday":"2020-10-06 11:55:21.870 GMT+0530 AM",
        "status":"OK",
        "total":3,
        "data":[
                {
                        "id":"Dc2TEsJGHQx6LuhRbhIJKhhI/Vo=",
                        "description":"MapR Base Edition",
                        "goldposixnodes":"10",
                        "isAdditionalFeature":false,
                        "deletable":false,
                        "grace":true,
                        "license":"version: \"4.0\"\ncustomerid: \"BaseLicenseUser\"\nissuer: \"MapR Technologies,
                         Inc.\"\nlicType: Base\ndescription: \"MapR Base Edition\"\nenforcement: HARD\ncapabilities {\n  feature: MAXNODES\n  name: \"Max Nodes in Cluster\"\n  permission: ALLOW\n  featureData {\n    maxNodes: \"unlimited\"\n  }\n}\ncapabilities {\n  feature: MAPR_TABLES\n  name: \"MapR Tables\"\n  permission: ALLOW\n}\ncapabilities {\n  feature: MAPR_TABLES_FULL\n  name: \"MapR Tables Full\"\n  permission: ALLOW\n}\ncapabilities {\n  feature: MAPR_STREAMS\n  name: \"MapR Streams\"\n  permission: ALLOW\n}\ncapabilities {\n  feature: POSIX_CLIENT_GOLD\n  name: \"MapR POSIX Client for Containerized Apps\"\n  permission: ALLOW\n  featureData {\n    maxNfsClientNodes: \"10\"\n  }\n}\nhash: \"Dc2TEsJGHQx6LuhRbhIJKhhI/Vo=\"\n"
                },
  
```
###### Start and Stop Commands
- wrestart=service mapr-warden restart
##### Example:-
```sh
[root@8vm1 ~]# source $DOWNLOAD_DIR/mapr_core.sh
[root@8vm1 ~]# wrestart
Redirecting to /bin/systemctl restart mapr-warden.service
[root@8vm1 ~]#
```
- zrestart=service mapr-zookeeper restart
- wstop=service mapr-warden stop
- wstart=service mapr-warden start
- zstop=service mapr-zookeeper stop
- zstart=service mapr-zookeeper start
- fullrestart=service mapr-warden stop;service mapr-zookeeper stop;service mapr-zookeeper start;service mapr-warden start
- fullstop=service mapr-warden stop;service mapr-zookeeper stop
##### Example:-
```sh
[root@8vm1 ~]# fullstop
Redirecting to /bin/systemctl stop mapr-warden.service
Redirecting to /bin/systemctl stop mapr-zookeeper.service
```
-fullstart==service mapr-zookeeper start;=service mapr-warden start
##### Example:-
```sh
[root@8vm1 ~]# fullstart
Redirecting to /bin/systemctl start mapr-zookeeper.service
Redirecting to /bin/systemctl start mapr-warden.service
[root@8vm1 ~]#
```

###### volumes and containers
- vdump=maprcli dump volumeinfo -volumename
###### Usage:-
```sh
$ vdump <volume name> -json
```
- cdump=maprcli dump containerinfo -ids
###### Usage:-
```sh
$ cdump <container name> -json
```
- vinfo=maprcli volume info -name
###### Usage:-
```sh
$ vinfo <volume name> -json
```
###### mrconfig 
- spv=$MAPR_HOME/server/mrconfig sp list -v
##### Example
```sh
[mapr@8vm1]$ $DOWNLOAD_DIR/mapr_core.sh
[mapr@8vm1]$ spv
ListSPs resp: status 0:1
No. of SPs (1), totalsize 23329 MB, totalfree 22882 MB

SP 0: name SP1, Online, size 23329 MB, free 22882 MB, path /dev/sdb, log 200 MB, port 5660, guid 009e86625027f8d7005f6dce8b0db994, clusterUuid -6984502711002182787-2631940549599184494, disks /dev/sdb, dare 0, label default:0

```
- ithreads=$MAPR_HOME/server/mrconfig info threads
##### Example:-
```sh
[mapr@8vm1 ~]$ ithreads

----------------------
Time: 2020-10-06 13:38:34,1955 Instance 5660
----------------------
No Running threads
```
- islab=$MAPR_HOME/server/mrconfig info slabs
##### Example:- Output is truncated to save space.
```sh
[mapr@8vm1 ~]$ islab

----------------------
Time: 2020-10-06 13:40:21,4736 Instance 5660
----------------------
Slab                     : Default Active Free : Objects X ObjSize: Memory
WriteFileHandle          : 128    0      128   : 128     X  209096:  26764288
ReadFileHandle           : 128    0      128   : 128     X   97944:  12536832
GetattrHandle            : 128    0      128   : 128     X   18512:   2369536
KvstoreScanHandle        : 128    0      128   : 128     X   20360:   2606080
KvstoreMultiScanHandle   : 128    0      128   : 128     X   20312:   2599936

```
- dbthreads=$MAPR_HOME/server/mrconfig dbinfo threads
##### Example:-
```sh
[mapr@8vm1 ~]$ dbthreads

----------------------
Time: 2020-10-06 13:38:39,7945 Instance 5660
----------------------
ThrottleQ : maxSlots 1024 freeSlots 1024 hasWaiters 0 totalWaits 0
InternalOpThrottleQ1 : maxSlots 24576 freeSlots 24576 hasWaiters 0 totalWaits 0
InternalOpThrottleQ2 : maxSlots 24576 freeSlots 24576 hasWaiters 0 totalWaits 0
InternalOpThrottleQ3 : maxSlots 24576 freeSlots 24576 hasWaiters 0 totalWaits 0
[mapr@8vm1 ~]$

```
###### MapR Ticket's
- usemaprticket=export MAPR_TICKETFILE_LOCATION=$MAPR_HOME/conf/mapruserticket
##### Example:- Use with caution. Use only if you clearly understand what you are doing.
```sh
[mapr@8vm1 ~]$ maprlogin end
[mapr@8vm1 ~]$ maprlogin print
Opening keyfile /tmp/maprticket_5000
keyfile not found
[mapr@8vm1 ~]$ usemaprticket
[mapr@8vm1 ~]$ maprlogin print
Opening keyfile /opt/mapr/conf/mapruserticket
8vm1.example.com: user = mapr, created = 'Fri Sep 25 16:36:21 IST 2020', expires = 'Fri Jun 17 23:01:17 IST 29229672', Not renewable, uid = 5000, gids = 5000, 5001, CanImpersonate = true, isExternal = false
[mapr@8vm1 ~]$
```
- mlogin=maprlogin password
##### Example:-
```sh
[root@8vm1 ~]# mlogin
[Password for user 'root' at cluster '8vm1.example.com': ]
MapR credentials of user 'root' for cluster '8vm1.example.com' are written to '/tmp/maprticket_0'
[root@8vm1 ~]#
```
###### Oneline commands
- top20containers=Gets top 20 containers from mrconfig info dumpcontainers output and sort based on logical size
###### Example:-
```sh
[mapr@8vm1]$ top20containers
[mapr@8vm1 ~]$ top20containers
cid:2181:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:4791
cid:2181:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:4791
cid:2116:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:2718
cid:2116:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:2718
cid:2197:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:820
cid:2197:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:820
cid:2200:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:680
cid:2200:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:680
cid:2198:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:669
cid:2198:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:669
cid:2196:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:523
cid:2196:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:523
cid:2199:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:501
cid:2199:volid:114024903:sp:SP1:/dev/sdb:issnap:0:logical:501
cid:2117:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:254
cid:2117:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:254
cid:1:volid:1:sp:SP1:/dev/sdb:issnap:0:logical:188
cid:1:volid:1:sp:SP1:/dev/sdb:issnap:0:logical:188
cid:2183:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:151
cid:2183:volid:30391668:sp:SP1:/dev/sdb:issnap:0:logical:151

[mapr@8vm1 alias]$
```
- mfstop= Runs top -p "mfspid" -H
##### Example:-
```sh
[root@8vm1 ~]# mfstop
top - 13:25:19 up 11 days, 21:15,  2 users,  load average: 0.28, 0.44, 1.19
Threads:  29 total,   0 running,  29 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  0.5 sy,  0.0 ni, 98.4 id,  0.0 wa,  0.5 hi,  0.0 si,  0.0 st
MiB Mem :  15872.9 total,   2546.8 free,   9535.2 used,   3790.9 buff/cache
MiB Swap:   5120.0 total,   5114.9 free,      5.1 used.   5868.3 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
1931913 mapr      10 -10 5280376   4.6g  51644 S   1.3  29.9   0:11.54 mfs.TT
1931912 mapr      10 -10 5280376   4.6g  51644 S   0.3  29.9   0:04.68 mfs0.FS
1931911 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs
1931932 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.Compr0
1931933 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.Compr1
1931934 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.Compr2
1932038 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.16 mfs0.IOEvents
1932039 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.26 mfs0.IOSubmit
1932041 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.18 mfs0.DB0
1932042 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DB1
1932043 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DB2
1932044 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DB3
1932045 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush0
1932046 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush1
1932047 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush2
1932048 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush3
1932049 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush4
1932050 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.DBFlush5
1932051 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.SysCall0
1932052 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.SysCall1
1932053 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.SysCall2
1932056 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:01.37 mfs0.Rpc1
1932057 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.26 mfs0.Rpc2
1932058 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.25 mfs0.Rpc3
1932059 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.RpcCon2
1932060 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.RpcCon1
1932061 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:02.11 mfs0.Rpc0
1932062 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.RpcCon3
1932063 mapr      10 -10 5280376   4.6g  51644 S   0.0  29.9   0:00.00 mfs0.RpcCon0

```
- getmep=Gets MAPR Ecosystem release version.
###### Example:-
```sh
[mapr@8vm1]$ getmep
MEP-7.0.0
[mapr@8vm1]$

```
- mapr_totalspace=Runs maprcli volume list  -columns aen,n,tsu,used,dlu,drf,snapshotused
###### Example:-
```sh
[mapr@8vm1 ~]$ mapr_totalspace
volumename                             aetype  logicalUsed  aename  numreplicas  totalused  snapshotused  used
mapr.8vm1.example.com.local.audit      0       0            mapr    2            0          0             0
mapr.8vm1.example.com.local.logs       0       0            mapr    2            0          0             0
mapr.8vm1.example.com.local.mapred     0       0            mapr    1            0          0             0
mapr.8vm1.example.com.local.metrics    0       39           mapr    2            29         0             29
mapr.8vm1.example.com.local.nmstaging  0       0            mapr    1            0          0             0
mapr.apps                              0       0            mapr    3            0          0             0
mapr.cldb.internal                     0       1            mapr    3            1          0             1
mapr.cluster.root                      0       0            mapr    3            0          0             0
mapr.configuration                     0       0            mapr    3            0          0             0
mapr.hbase                             0       0            mapr    3            0          0             0
mapr.metrics                           0       0            mapr    3            0          0             0
mapr.monitoring                        0       0            mapr    3            0          0             0
mapr.monitoring.metricstreams          0       0            mapr    3            0          0             0
mapr.opt                               0       0            mapr    3            0          0             0
mapr.pbs.base                          0       0            mapr    3            0          0             0
mapr.pbs.composite                     0       0            mapr    3            0          0             0
mapr.resourcemanager.volume            0       1            mapr    3            1          0             1
mapr.tmp                               0       0            mapr    3            0          0             0
mapr.var                               0       0            mapr    3            0          0             0
users                                  0       0            mapr    3            0          0             0
[mapr@8vm1 ~]$

```

###### Change directories and Editors
- cdmfslogs='cd $MAPR_HOME/logs'
##### Example:-
```sh
[root@8vm1 ~]# pwd
/root
[root@8vm1 ~]# cdmfslogs
[root@8vm1 logs]# pwd
/opt/mapr/logs
[root@8vm1 logs]#

```
- vicoresite='vi $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml'
- opencldblogs='less $MAPR_HOME/logs/cldb.log'
- openmfslog3='less $MAPR_HOME/logs/mfs.log-3'
- openmfslog5='less $MAPR_HOME/logs/mfs.log-5'
###### Backup config files
- filebackup= Backups file provided at same location as source with date +%Y%m%d%H%M timestamp.
##### Example:-
Single file backup
```sh
[mapr@8vm1 ~]$ ls -l /opt/mapr/conf/mapr-clusters.conf*
-rw-r--r-- 1 mapr mapr 51 Sep 25 16:35 /opt/mapr/conf/mapr-clusters.conf
[mapr@8vm1 ~]$ filebackup /opt/mapr/conf/mapr-clusters.conf
[mapr@8vm1 ~]$ ls -l /opt/mapr/conf/mapr-clusters.conf*
-rw-r--r-- 1 mapr mapr 51 Sep 25 16:35 /opt/mapr/conf/mapr-clusters.conf
-rw-r--r-- 1 mapr mapr 51 Sep 25 16:35 /opt/mapr/conf/mapr-clusters.conf.202010061312
[mapr@8vm1 ~]$
```
Multiple Files backup
```sh
[mapr@8vm1 ~]$ ls -l /opt/mapr/conf/cldb.conf* /opt/mapr/conf/clusterid*
-rw-r--r-- 1 mapr mapr 2291 Sep 25 16:43 /opt/mapr/conf/cldb.conf
-rw------- 1 mapr mapr   20 Oct  6 13:07 /opt/mapr/conf/clusterid
[mapr@8vm1 ~]$ filebackup /opt/mapr/conf/cldb.conf /opt/mapr/conf/clusterid
[mapr@8vm1 ~]$ ls -l /opt/mapr/conf/cldb.conf* /opt/mapr/conf/clusterid*
-rw-r--r-- 1 mapr mapr 2291 Sep 25 16:43 /opt/mapr/conf/cldb.conf
-rw-r--r-- 1 mapr mapr 2291 Sep 25 16:43 /opt/mapr/conf/cldb.conf.202010061315
-rw------- 1 mapr mapr   20 Oct  6 13:07 /opt/mapr/conf/clusterid
-rw------- 1 mapr mapr   20 Oct  6 13:07 /opt/mapr/conf/clusterid.202010061315
[mapr@8vm1 ~]$
```

###### Config save
- maprcliconfig_save=maprcli config save -values '{'"$KEY"':'"$VALUE"'}'
- Usage:-
```sh
$ maprcliconfig_save "<key> <value>"
```
##### Example:-
```sh
[mapr@8vm1 ~]$ maprcli config load -json |grep dbal.below.avg.bin.size
237:                    "dbal.below.avg.bin.size":"5",
[mapr@8vm1 ~]$ maprcliconfig_save dbal.below.avg.bin.size 10
Success:Command completed successfully
[mapr@8vm1 ~]$ maprcli config load -json |grep dbal.below.avg.bin.size
237:                    "dbal.below.avg.bin.size":"10",
[mapr@8vm1 ~]$

```

###### Enable Filesystem Debug 
- enablecoredebug=Add's "fs.mapr.trace=TRACE" in core-site.xml
##### Example:- Action needs to be performed as root user.
```sh
[root@8vm1 ~]# cat /opt/mapr/hadoop/hadoop-2.7.4/etc/hadoop/core-site.xml
<configuration>

  <property>
    <name>hadoop.proxyuser.mapr.hosts</name>
    <value>*</value>
    <description>The superuser mapr can connect from any host to impersonate a user</description>
  </property>
  <property>
    <name>hadoop.proxyuser.mapr.groups</name>
    <value>*</value>
    <description>Allow the superuser mapr to impersonate any member of any group</description>
  </property>
</configuration>
[root@8vm1 ~]# enablecoredebug
<configuration>

  <property>
    <name>hadoop.proxyuser.mapr.hosts</name>
    <value>*</value>
    <description>The superuser mapr can connect from any host to impersonate a user</description>
  </property>
  <property>
    <name>hadoop.proxyuser.mapr.groups</name>
    <value>*</value>
    <description>Allow the superuser mapr to impersonate any member of any group</description>
  </property>
<property>
<name>fs.mapr.trace</name>
<value>DEBUG</value>
</property>
</configuration>
mv: overwrite '/opt/mapr/hadoop/hadoop-2.7.4/etc/hadoop/core-site.xml'?y

[root@8vm1 ~]# cat /opt/mapr/hadoop/hadoop-2.7.4/etc/hadoop/core-site.xml
<configuration>
  <property>
    <name>hadoop.proxyuser.mapr.hosts</name>
    <value>*</value>
    <description>The superuser mapr can connect from any host to impersonate a user</description>
  </property>
  <property>
    <name>hadoop.proxyuser.mapr.groups</name>
    <value>*</value>
    <description>Allow the superuser mapr to impersonate any member of any group</description>
  </property>
<property>
<name>fs.mapr.trace</name>
<value>DEBUG</value>
</property>
</configuration>
[root@8vm1 ~]#

```

- take_gstack=Takes gstack of C process.Usually used to take stack strace for mfs process.
- Usage:- 
 ```sh
$take_gstack "<Number of gstack to be taken> <PID of Process> <sleep duration>"
``` 
##### Example:- Run as mapr user.
```sh
[mapr@8vm1 ~]$ pidof mfs
1931911
[mapr@8vm1 ~]$ take_gstack
ERROR:Usage:- take_gstack <Number of gstack to be taken> <PID of Process> <sleep duration>
[mapr@8vm1 ~]$ take_gstack  2 1931911 5
Good output directory is empty
1:Written output to /tmp/gstack/gstack_1931911/gstack.1931911.1  .Sleeping for 5 secs
2:Written output to /tmp/gstack/gstack_1931911/gstack.1931911.2  .Sleeping for 5 secs
[mapr@8vm1 ~]$

```

## YARN

* YARN
```sh
$ source $DOWNLOAD_DIR/mapr_yarn.sh
```

- viyarnsite= Open yarn-site.xml in vi mode.
- openyarnlogs=Open yarn resource manager logs in less.
- cdhdlogs=cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/logs
- cdhdconf=cd $MAPR_HOME/hadoop/hadoop-$HADOOP_VERSION/etc/hadoop
- activerm=Runs maprcli urls -name resourcemanager and print active resouremanager url.
- containerassigment=Gets Resourcemanager container assignment speed per mins from current resource manager logs.
##### Example:-
```sh
[mapr@8vm1 ~]$ containerassigment
      1 1:1:334:2020-09-25 16:52
      1 12:12:633:2020-10-02 13:12
      1 13:13:658:2020-10-02 13:12
      1 17:17:718:2020-10-02 13:15
      1 18:18:743:2020-10-02 13:15
      1 22:22:877:2020-10-05 15:45
      1 2:2:359:2020-09-25 16:52
      1 23:23:902:2020-10-05 15:45
      1 26:26:956:2020-10-05 16:01
      1 27:27:981:2020-10-05 16:01
      1 30:30:1035:2020-10-05 16:03
      1 31:31:1060:2020-10-05 16:03
      1 34:34:1114:2020-10-05 16:06
      1 35:35:1139:2020-10-05 16:06
      1 38:38:1193:2020-10-05 16:07
      1 39:39:1218:2020-10-05 16:07
      1 42:42:1272:2020-10-05 16:08
      1 43:43:1297:2020-10-05 16:08
      1 4:4:371:2020-09-25 16:52
      1 46:46:1351:2020-10-05 16:31
      1 47:47:1376:2020-10-05 16:31
      1 49:49:1388:2020-10-05 16:31
      1 7:7:425:2020-09-25 16:53
      1 8:8:450:2020-09-25 16:53
[mapr@8vm1 ~]$

```
- runpijob=Runs yarn pi job with 10 samples. Schedules Job to default queue.
##### Example:-
```sh
[mapr@8vm1 ~]$ runpijob
Number of Maps  = 10
Samples per Map = 10
Wrote input for Map #0
Wrote input for Map #1
Wrote input for Map #2
Wrote input for Map #3
Wrote input for Map #4
Wrote input for Map #5
Wrote input for Map #6
Wrote input for Map #7
Wrote input for Map #8
Wrote input for Map #9
Starting Job
20/10/06 13:35:34 INFO client.MapRZKBasedRMFailoverProxyProvider: Updated RM address to 8vm1.example.com/10.10.73.43:8032
20/10/06 13:35:35 INFO input.FileInputFormat: Total input paths to process : 10
20/10/06 13:35:35 INFO mapreduce.JobSubmitter: number of splits:10
20/10/06 13:35:35 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601969868093_0002
20/10/06 13:35:35 INFO security.ExternalTokenManagerFactory: Initialized external token manager class - org.apache.hadoop.yarn.security.MapRTicketManager
20/10/06 13:35:35 INFO impl.YarnClientImpl: Submitted application application_1601969868093_0002
20/10/06 13:35:36 INFO mapreduce.Job: The url to track the job: https://8vm1.example.com:8090/proxy/application_1601969868093_0002/
20/10/06 13:35:36 INFO mapreduce.Job: Running job: job_1601969868093_0002

```
- runpijobdebug= Runs yarn pi job in mapr filesystem debug mode with 10 samples. Schedules Job to default queue.
- application_break=Breaks application logs in each container file with container name.
###### Usage

```sh
application_break  <application id>
```
###### Example:-
```sh
[mapr@8vm1 app]$ source $DOWNLOAD_DIR/mapr_yarn.sh
[mapr@8vm1 app]$ ls -lrt
total 184
-rw-rw-r-- 1 mapr mapr 186194 Oct  1 16:30 application_1601173923005_0003
[mapr@8vm1 app]$ application_break application_1601173923005_0003
container_e72_1601173923005_0003_01_000009 done
container_e72_1601173923005_0003_01_000006 done
container_e72_1601173923005_0003_01_000007 done
container_e72_1601173923005_0003_01_000010 done
container_e72_1601173923005_0003_01_000011 done
container_e72_1601173923005_0003_01_000005 done
container_e72_1601173923005_0003_01_000003 done
container_e72_1601173923005_0003_01_000008 done
container_e72_1601173923005_0003_01_000001 done
container_e72_1601173923005_0003_01_000014 done
container_e72_1601173923005_0003_01_000004 done
container_e72_1601173923005_0003_01_000002 done
[mapr@8vm1 app]$ ls -l
total 188
-rw-rw-r-- 1 mapr mapr 186194 Oct  1 16:30 application_1601173923005_0003
drwxrwxr-x 2 mapr mapr   4096 Oct  6 11:27 application_1601173923005_0003_breakdown
[mapr@8vm1 app]$ ls -l application_1601173923005_0003_breakdown/
total 212
-rw-rw-r-- 1 mapr mapr 135779 Oct  6 11:27 container_e72_1601173923005_0003_01_000001.txt
-rw-rw-r-- 1 mapr mapr   4154 Oct  6 11:27 container_e72_1601173923005_0003_01_000002.txt
-rw-rw-r-- 1 mapr mapr   4238 Oct  6 11:27 container_e72_1601173923005_0003_01_000003.txt
-rw-rw-r-- 1 mapr mapr   4235 Oct  6 11:27 container_e72_1601173923005_0003_01_000004.txt
-rw-rw-r-- 1 mapr mapr   4238 Oct  6 11:27 container_e72_1601173923005_0003_01_000005.txt
-rw-rw-r-- 1 mapr mapr   4238 Oct  6 11:27 container_e72_1601173923005_0003_01_000006.txt
-rw-rw-r-- 1 mapr mapr   3868 Oct  6 11:27 container_e72_1601173923005_0003_01_000007.txt
-rw-rw-r-- 1 mapr mapr   4235 Oct  6 11:27 container_e72_1601173923005_0003_01_000008.txt
-rw-rw-r-- 1 mapr mapr   3868 Oct  6 11:27 container_e72_1601173923005_0003_01_000009.txt
-rw-rw-r-- 1 mapr mapr   3868 Oct  6 11:27 container_e72_1601173923005_0003_01_000010.txt
-rw-rw-r-- 1 mapr mapr   3868 Oct  6 11:27 container_e72_1601173923005_0003_01_000011.txt
-rw-rw-r-- 1 mapr mapr  10505 Oct  6 11:27 container_e72_1601173923005_0003_01_000014.txt
```
- scheduler_debug=Enables yarn scheduler debug.

## Hive:- 
```sh
$ source $DOWNLOAD_DIR/mapr_hive.sh
```
###### Usage:-
```sh
source $DOWNLOAD_DIR/mapr_hive.sh
```
- vihivesite=Opens hive-site.xml in vi mode.
- open_beeline=Runs hive --service beeline
##### Example:-
```sh
[mapr@8vm1 ~]$ open_beeline
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/mapr/hive/hive-2.3/lib/log4j-slf4j-impl-2.12.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/mapr/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Beeline version 2.3.7-mapr-2009 by Apache Hive
beeline>

```
- openhs2logs=Runs less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-hiveserver2-`hostname -f`.log
- alias openmetalogs=Runs less $MAPR_HOME/hive/hive-$HIVE_VERSION/logs/mapr/mapr-metastore-`hostname -f`.log
- cdhivelogs=Change working dir to $MAPR_HOME/hive/hive-$HIVE_VERSION/logs
##### Example:-
```sh
[mapr@8vm1 ~]$ pwd
/home/mapr
[mapr@8vm1 ~]$ cdhivelogs
[mapr@8vm1 logs]$ pwd
/opt/mapr/hive/hive-2.3/logs
[mapr@8vm1 logs]$

```
- cdhiveconf=Change working dir to cd $MAPR_HOME/hive/hive-$HIVE_VERSION/conf
 ##### Example:-
```sh
[mapr@8vm1 ~]$ pwd
/home/mapr
[mapr@8vm1 ~]$ cdhiveconf
[mapr@8vm1 conf]$ pwd
/opt/mapr/hive/hive-2.3/conf
[mapr@8vm1 conf]$


```
- get_set=Gets set -v output from hive shell and stores it in /tmp/hive/hive.set
##### Example:-
```sh
[mapr@8vm1 ~]$ get_set
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/mapr/hive/hive-2.3/lib/log4j-slf4j-impl-2.12.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/mapr/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
SUCCESS:Output available at :/tmp/hive/hive.set
[mapr@8vm1 ~]$ head /tmp/hive/hive.set
_hive.hdfs.session.path=/user/mapr/tmp/hive/mapr/0e21aea9-8116-46f8-a12b-d6a244573377
_hive.local.session.path=/tmp/mapr/0e21aea9-8116-46f8-a12b-d6a244573377
_hive.tmp_table_space=/user/mapr/tmp/hive/mapr/0e21aea9-8116-46f8-a12b-d6a244573377/_tmp_space.db
datanucleus.cache.level2=false
datanucleus.cache.level2.type=none
datanucleus.connectionPool.maxPoolSize=10
datanucleus.connectionPoolingType=BONECP
datanucleus.identifierFactory=datanucleus1
datanucleus.plugin.pluginRegistryBundleCheck=LOG
datanucleus.rdbms.initializeColumnInfo=NONE
[mapr@8vm1 ~]$


```
- createhivetable=Creates a hive table with name  mapr_test_$(date +%Y%m%d%H%M%S) and loads it with sample data of 100 rows.
##### Example:-
```sh
[mapr@8vm1 ~]$ createhivetable
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/mapr/hive/hive-2.3/lib/log4j-slf4j-impl-2.12.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/mapr/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
OK
Time taken: 2.833 seconds
Loading data to table default.mapr_test_20201006145046
OK
Time taken: 1.111 seconds
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
Query ID = mapr_20201006145101_d8a9ac4f-3d63-4f62-a7b3-9308d5222f0c
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.apache.hadoop.hive.ql.exec.SerializationUtilities$ArraysAsListSerializer (file:/opt/mapr/hive/hive-2.3/lib/hive-exec-2.3.7-mapr-2009.jar) to field java.util.Arrays$ArrayList.a
WARNING: Please consider reporting this to the maintainers of org.apache.hadoop.hive.ql.exec.SerializationUtilities$ArraysAsListSerializer
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
Starting Job = job_1601969868093_0003, Tracking URL = https://8vm1.example.com:8090/proxy/application_1601969868093_0003/
Kill Command = /opt/mapr/hadoop/hadoop-2.7.4/bin/hadoop job  -kill job_1601969868093_0003


```

## HBASE:-
```sh
$ source $DOWNLOAD_DIR/mapr_hbase.sh
```
###### Usage:-
```sh
source $DOWNLOAD_DIR/mapr_hbase.sh
```

- cdhbaselogs=Runs cd $MAPR_HOME/hbase/hbase-$HBASE_VERSION/logs
- openhbasemasterlogs= Open hbase master logs in less command.
- openhbaseregionlogs= Open hbase region server logs in less command.
- vihbasesite=vi $MAPR_HOME/hbase/hbase-$HASE_VERSION/hbase-site.xml
- shutdown_hbase=Completely shutdown hbase servcies i.e hbase regionserver and master services.
- start_hbase=Start hbase services on all configure master nodes
- hbasestatusdetailed=Gets status 'detailed' output from hbase shell and stores it in /tmp/hbase/hbase.status.out
- hbasescanmeta=Scan's hbase meta table and stores output in /tmp/hbase/scan.meta

## Spark

```sh
$ source $DOWNLOAD_DIR/mapr_spark.sh
```
- visparkdefault='vi $MAPR_HOME/spark/spark-$SPARK_VERSION/conf/spark-defaults.conf'
- get_sparkhistoryserver='maprcli urls -name spark-historyserver'
- run_sparkpi= Run spark pi job with 100 samples.

## JAVA Debugging.
- take_jstat= Takes jstat 
##### Example:-
```sh
[mapr@8vm1 ~]$ jps -l |grep cldb
1933189 com.mapr.fs.cldb.CLDB
[mapr@8vm1 ~]$
[mapr@8vm1 ~]$ take_jstat
ERROR:Usage:- take_jstat  <PID of Process> <sleep interval in milli-secs> <Number of samples>
[mapr@8vm1 ~]$ take_jstat 1933189 5000 5
Ouput directory is not Empty.Moving previous data to folder /tmp/jstat/jstat_1933189/previous_output.2318834
  S0     S1     E      O      M     CCS    YGC     YGCT    FGC    FGCT     GCT
 11.35   0.00  84.31   7.90  96.39  86.22      8    0.217     0    0.000    0.217
 11.35   0.00  84.38   7.90  96.39  86.22      8    0.217     0    0.000    0.217
 11.35   0.00  85.53   7.90  96.39  86.22      8    0.217     0    0.000    0.217
 11.35   0.00  85.54   7.90  96.39  86.22      8    0.217     0    0.000    0.217
 11.35   0.00  85.56   7.90  96.39  86.22      8    0.217     0    0.000    0.217
Output written to file /tmp/jstat/jstat_1933189/jstat.1933189
```
- take_jstack= Takes jstack
##### Example:-
```sh
[mapr@8vm1 ~]$ jps -l |grep cldb
1933189 com.mapr.fs.cldb.CLDB
[mapr@8vm1 ~]$ take_jstack
ERROR:Usage:- take_jstack <Number of jstack to be taken> <PID of Process> <sleep duration>
[mapr@8vm1 ~]$ take_jstack 5 1933189 5
Good output directory is empty
1:Written output to /tmp/jstack/jstack_1933189/jstack.1933189.1  .Sleeping for 5 secs
2:Written output to /tmp/jstack/jstack_1933189/jstack.1933189.2  .Sleeping for 5 secs
3:Written output to /tmp/jstack/jstack_1933189/jstack.1933189.3  .Sleeping for 5 secs
4:Written output to /tmp/jstack/jstack_1933189/jstack.1933189.4  .Sleeping for 5 secs
5:Written output to /tmp/jstack/jstack_1933189/jstack.1933189.5  .Sleeping for 5 secs
[mapr@8vm1 ~]$

```

- take_heapdump=Takes Java heapdump of specified process.
##### Example:-
```sh
[mapr@8vm1 ~]$ jps -l |grep cldb
1933189 com.mapr.fs.cldb.CLDB
[mapr@8vm1 ~]$ take_heapdump
ERROR:Usage:- take_heapdump  <Output Location> <Process PID>
[mapr@8vm1 ~]$ take_heapdump /tmp 1933189
Please ensure you have sufficient space in output directory?.Please confirm [Y/n]y
You selected yes, so continuing
Ouput directory is not Empty.Moving previous data to folder /tmp/jmap/jmap_1933189_previous_output
mv /tmp/jmap/jmap_1933189/* /tmp/jmap/jmap_1933189_previous_output/heapdump.202010061624
Dumping heap to /tmp/jmap/jmap_1933189/1933189.hprof ...
Heap dump file created
Success:Command executed successfully
Outputfile location : /tmp/jmap/jmap_1933189/1933189.hprof
Dump size is: 91M       /tmp/jmap/jmap_1933189/1933189.hprof
[mapr@8vm1 ~]$


```


