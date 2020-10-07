#!/bin/bash
###################################################################
#Script Name    :mapr_spark.sh
#Description    :Script contains alias and functions for frequent used commands with mapr datafabric
#Args           :
#Author         :Saikant Gajula
#Email          :gajulasaikant@gmail.com
###################################################################

#Global Variables
MAPR_HOME=/opt/mapr
SPARK_VERSION=`cat $MAPR_HOME/spark/sparkversion`


alias visparkdefault='vi $MAPR_HOME/spark/spark-$SPARK_VERSION/conf/spark-defaults.conf'



alias get_sparkhistoryserver='maprcli urls -name spark-historyserver'

alias run_sparkpi='$MAPR_HOME/spark/spark-2.$SPARK_VERSION/bin/run-example --master yarn --deploy-mode client  SparkPi 100'
