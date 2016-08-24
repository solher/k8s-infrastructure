#!/bin/bash

./deploy-minikube.sh

# Letsencrypt
../mo letsencrypt/configmap.mo.yml | kubectl apply -f -
kubectl apply -f letsencrypt/deployment.yml