#!/bin/bash
kubectl exec -n kafka my-cluster-zookeeper-0 -c zookeeper  -- /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-brokers:9092 --from-beginning --topic my-topic