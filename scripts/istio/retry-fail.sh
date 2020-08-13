#!/bin/bash
kubectl exec -it $(kubectl get pods -n microservices|grep ola-v2|awk '{ print $1 }'|head -1) -n microservices -c ola -- wget -qO - http://localhost:3000/misbehave