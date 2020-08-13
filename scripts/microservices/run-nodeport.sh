#!/bin/bash
export INGRESS_PORT=$(kubectl -n microservices get service hello -o jsonpath='{.spec.ports[?(@.name=="http-8080")].nodePort}')


url=$1
if [ -z "$url" ]
then
    url="`minikube ip`:$INGRESS_PORT/"
fi

while true
do curl $url
sleep .5
done