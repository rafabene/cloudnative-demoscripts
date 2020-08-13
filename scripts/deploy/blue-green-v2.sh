#!/bin/bash
kubectl patch service -n microservices ola -p '{"spec":{ "selector": { "version": "v2"}}}'