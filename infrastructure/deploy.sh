#!/bin/bash

kubectl apply -f auth-server
kubectl apply -f dashboard
kubectl apply -f zipkin-cassandra
kubectl apply -f zipkin-cron
kubectl apply -f zipkin
