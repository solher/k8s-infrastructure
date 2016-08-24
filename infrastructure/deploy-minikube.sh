#!/bin/bash

# Namespace
kubectl apply -f namespace.yml

# Auth server
kubectl apply -f auth-server/configmap.yml
kubectl apply -f auth-server/deployment.yml
../mo auth-server/ingress.mo.yml | kubectl apply -f -
kubectl apply -f auth-server/pv-claim.yml
kubectl apply -f auth-server/service.yml

# Default ingress backend
kubectl apply -f default-backend

# Nginx
kubectl create configmap nginx --from-file=nginx --dry-run -o yaml | kubectl --namespace=infrastructure apply -f -
kubectl apply -f nginx

# Appdash
../mo appdash/deployment.mo.yml | kubectl apply -f -
../mo appdash/ingress.mo.yml | kubectl apply -f -
kubectl apply -f appdash/service.yml