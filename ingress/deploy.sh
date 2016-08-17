#!/bin/bash

kubectl apply -f namespace.yml
kubectl apply -f default-backend
kubectl create configmap nginx --from-file=nginx --dry-run -o yaml | kubectl --namespace=ingress apply -f -
kubectl apply -f nginx
kubectl apply -f letsencrypt
