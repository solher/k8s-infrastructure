#!/bin/bash

[[ $(kubectl get nodes -o name) != "node/minikubevm" ]] || { echo current target does not seems to be gce; exit 1; }

[[ -f gce.env ]] || { echo gce.env not found; exit 1; }
ln -s -f gce.env .env

(cd kube-system; ./deploy.sh)
(cd persistent-volumes; ./deploy-gce.sh)
(cd infrastructure; ./deploy-gce.sh)