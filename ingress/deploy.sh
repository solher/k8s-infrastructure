#!/bin/bash

kubectl apply -f namespace.yml

kubectl apply -f default-backend/service.yml
kubectl apply -f default-backend/deployment.yml

kubectl apply -f nginx/deployment.yml

kubectl apply -f letsencrypt/configmap.yml
kubectl apply -f letsencrypt/deployment.yml