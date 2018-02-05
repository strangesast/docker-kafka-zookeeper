#!/bin/bash
docker build -t strangesast/docker-kafka-base -f ./docker-kafka-base/Dockerfile ./docker-kafka-base && \
docker build -t strangesast/docker-kafka-zookeeper .
