#!/bin/bash

(cd kube-system; ./deploy.sh)
(cd ingress; ./deploy.sh)
(cd infrastructure; ./deploy.sh)