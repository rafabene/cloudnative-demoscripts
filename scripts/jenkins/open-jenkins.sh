#! /bin/bash
kubectl -n cicd port-forward $(kubectl -n cicd get pod -l app=jenkins -o jsonpath='{.items[0].metadata.name}') 8081:8080 &
sleep 1
DASHBOARD="http://localhost:8081/blue"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    gio open $DASHBOARD
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    open $DASHBOARD
fi

