#!/bin/bash
export INGRESS_PORT=$(kubectl -n kube-logging get service kibana -o jsonpath='{.spec.ports[0].nodePort}')

DASHBOARD="http://192.168.100.100:$INGRESS_PORT/"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    gio open $DASHBOARD
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    open $DASHBOARD
fi
