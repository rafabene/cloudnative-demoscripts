#!/bin/bash
kubectl label namespace microservices istio-injection=enabled --overwrite
kubectl delete pods -n microservices  --all --grace-period 0 --force
kubectl delete -n microservices -f provision/mysql/deployment.yaml -f provision/mysql/service.yaml 
kubectl set env -n microservices deployment/ola-v1 MYSQL_HOST-
kubectl set env -n microservices deployment/ola-v2 MYSQL_HOST-
