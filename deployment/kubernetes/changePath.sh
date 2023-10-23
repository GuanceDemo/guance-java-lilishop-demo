#!/bin/bash

ORIGIN_PATH=/root/guance-java-lilishop-demo/deployment/kubernetes
PUB_PATH=$PWD
PUB_DATA_PATH=$PWD/data
ORIGIN_DATA_PATH=$ORIGIN_PATH/data

mkdatadir() {
  mkdir -p $PUB_DATA_PATH/middleware/mysql
  # configData /middleware/mysql
  mkdir -p $PUB_DATA_PATH/middleware/redis
  # configData /middleware/redis
  mkdir -p $PUB_DATA_PATH/middleware/elasticsearch/data
  # configData /middleware/elasticsearch/data
  mkdir -p $PUB_DATA_PATH/middleware/elasticsearch/logs
  # configData /middleware/elasticsearch/logs
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/logs
  # configData /middleware/rocketmq/logs
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/store
  # configData /middleware/rocketmq/store
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/logs-a
  # configData /middleware/rocketmq/logs-a
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/store-a
  # configData /middleware/rocketmq/store-a
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/logs-as
  # configData /middleware/rocketmq/logs-as
  mkdir -p $PUB_DATA_PATH/middleware/rocketmq/store-as
  # configData /middleware/rocketmq/store-as
  mkdir -p $PUB_DATA_PATH/middleware/xxl-job
  # configData /middleware/xxl-job
  changeAccessPermissions
}

changeAccessPermissions() {
  chmod -R 777 $PUB_DATA_PATH/middleware/rocketmq
  chmod -R 777 $PUB_DATA_PATH/middleware/elasticsearch
}

config() {
  TMP_ORIGIN_PATH=` echo $ORIGIN_PATH | sed 's#\/#\\\/#g'`
  TMP_PUB_PATH=` echo $PUB_PATH | sed 's#\/#\\\/#g'`
  sed -i "s/$TMP_ORIGIN_PATH/$TMP_PUB_PATH/g" `grep -rl "$ORIGIN_PATH" ./`
}

configData() {
  TMP_ORIGIN_PATH=` echo $ORIGIN_DATA_PATH$1 | sed 's#\/#\\\/#g'`
  TMP_PUB_DATA_PATH=` echo $PUB_DATA_PATH$1 | sed 's#\/#\\\/#g'`
  sed -i "s/$TMP_ORIGIN_PATH/$TMP_PUB_DATA_PATH/g" `grep -rl "$ORIGIN_PATH/data$1" ./`
}

mkdatadir

config


