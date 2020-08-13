#!/bin/bash
kubectl scale deployment -n microservices ola-v1 --replicas 3
kubectl apply -f istiofiles/destination-rule.yaml -n microservices
