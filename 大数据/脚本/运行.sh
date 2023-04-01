#! /bin/bash
export HADOOP_CONF_DIR=/usr/hdp/3.1.0.0-78/hadoop/conf
/usr/hdp/3.1.0.0-78/spark2/bin/spark-submit \
--class 这里是你要运行的类 \
--master local[2] \
--driver-memory 512m \
--executor-memory 512m \
--num-executors 2 \
/这里是你jar包的地址    最前面有这个/哦