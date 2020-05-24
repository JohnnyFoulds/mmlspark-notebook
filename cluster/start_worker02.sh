#!/bin/bash

sudo docker run --rm --name spark-worker02 \
	-e SPARK_MODE=worker \
	-e SPARK_RPC_ENCRYPTION_ENABLED=yes \
	-e SPARK_MASTER_URL=spark://192.168.1.215:7077 \
	-e SPARK_WORKER_PORT=43002 \
	-p 8081:8081 -p 43002:43002 \
	bitnami/spark:2.4.3
