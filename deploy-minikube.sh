#!/bin/bash

[[ $(kubectl get nodes -o name) == "node/minikubevm" ]] || { echo current target is not minikube; exit 1; }

[[ -f minikube.env ]] || { echo minikube.env not found; exit 1; }
ln -s -f minikube.env .env

kubectl label nodes minikubevm \
proxy=true \
infrastructure=true \
auth=true \
default=true --overwrite

(cd kube-system; ./deploy.sh)
(cd persistent-volumes; ./deploy-minikube.sh)
(cd infrastructure; ./deploy-minikube.sh)