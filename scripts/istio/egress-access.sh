#!/bin/bash
export INGRESS_PORT=$(kubectl -n microservices get service ola -o jsonpath='{.spec.ports[?(@.name=="http-3000")].nodePort}')

url="`minikube ip`:$INGRESS_PORT/getnow"

curl -v $url

