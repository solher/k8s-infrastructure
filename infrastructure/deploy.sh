#!/bin/bash

kubectl apply -f namespace.yml
kubectl apply -f auth-server
kubectl apply -f zipkin-cassandra
kubectl apply -f zipkin-cron
kubectl apply -f zipkin
