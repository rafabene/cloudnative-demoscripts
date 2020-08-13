#!/bin/bash
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

url="http://`minikube ip`:$INGRESS_PORT/hello"

while true
do curl $url
sleep .5
done