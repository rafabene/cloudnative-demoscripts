#!/bin/bash
kubectl apply -f istiofiles/destination-rule.yaml -n microservices
kubectl get configmap istio -n istio-system -o yaml | sed 's/mode: ALLOW_ANY/mode: REGISTRY_ONLY/g' | kubectl replace -n istio-system -f -

