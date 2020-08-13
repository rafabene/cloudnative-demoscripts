#!/bin/bash
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
value=$1

if [ -z "$value" ]
then
    echo "Inform the value for the 'test' header"
    exit 1
else
    url="http://`minikube ip`:$INGRESS_PORT/hello"
fi

while true
do curl --header "test: $value" $url
sleep .5
done