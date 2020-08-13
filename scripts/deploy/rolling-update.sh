#!/bin/bash

if [ "$1" == "" ]; then
    echo "Provide a version as an argument"
else
    kubectl set env -n microservices deployment ola-v1 VERSION=$1
    watch kubectl get pods -n microservices
fi