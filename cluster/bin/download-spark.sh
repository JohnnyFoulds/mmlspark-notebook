#/bin/bash

# set the software versions to download
SPARK_VERSION=2.4.3
HADOOP_VERSION=2.7

# download spark
wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# extract spark
tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
