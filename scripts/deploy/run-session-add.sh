#!/bin/bash
export INGRESS_PORT=$(kubectl -n microservices get service ola -o jsonpath='{.spec.ports[?(@.name=="http-3000")].nodePort}')
value=$1

if [ -z "$value" ]
then
    echo "Inform the value to add to session"
    exit 1
else
    url="http://`minikube ip`:$INGRESS_PORT/session/add/$value"
fi

curl -b cookie.txt -c cookie.txt $url
