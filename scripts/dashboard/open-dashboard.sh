#!/bin/sh
killall -9 kubectl
kubectl -n default port-forward $(kubectl -n default get pod -l app=dashboard -o jsonpath='{.items[0].metadata.name}') 8080:8080 &
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=jaeger -o jsonpath='{.items[0].metadata.name}') 15032:16686 &
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=kiali -o jsonpath='{.items[0].metadata.name}') 20001:20001 &
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &
kubectl -n cicd port-forward $(kubectl -n cicd get pod -l app=jenkins -o jsonpath='{.items[0].metadata.name}') 8081:8080 &
sleep 1
DASHBOARD=http://localhost:8080
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    gio open $DASHBOARD
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    open $DASHBOARD
fi
echo "Use the token above to login in the Kubernetes Dashboard"