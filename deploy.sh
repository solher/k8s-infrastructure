#!/bin/bash

(cd persistent-volumes; ./deploy.sh)
(cd kube-system; ./deploy.sh)
(cd ingress; ./deploy.sh)
(cd infrastructure; ./deploy.sh)