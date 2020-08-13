#!/bin/bash
killall -9 kubectl
kubectl delete namespace cicd --grace-period 0 --force || echo "cicd namespace deleted"
kubectl delete namespace microservices --grace-period 0 --force || echo "microservices namespace deleted"
kubectl delete deployment dashboard || echo "dashboard deployment deleted"
kubectl delete service dashboard || echo "dashboard service deleted"