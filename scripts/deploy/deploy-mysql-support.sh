#!/bin/bash
kubectl label namespace microservices istio-injection-
kubectl delete pods -n microservices  --all --grace-period 0 --force
kubectl apply -n microservices -f provision/mysql/deployment.yaml -f provision/mysql/service.yaml 
watch kubectl get pods -n microservices
kubectl set env -n microservices deployment/ola-v1 MYSQL_HOST=mysql
kubectl set env -n microservices deployment/ola-v2 MYSQL_HOST=mysql
kubectl delete pods -n microservices  -l app=ola --grace-period 0 --force
