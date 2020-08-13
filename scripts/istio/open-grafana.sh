#! /bin/bash
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
sleep 1
DASHBOARD="http://localhost:3000/"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    gio open $DASHBOARD
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    open $DASHBOARD
fi
