#!/bin/bash
export INGRESS_PORT=$(kubectl -n microservices get service ola -o jsonpath='{.spec.ports[?(@.name=="http-3000")].nodePort}')
value=$1

    url="http://192.168.100.100:$INGRESS_PORT/session/get"

while true
do curl -b cookie.txt -c cookie.txt $url
echo
sleep .5
done