#!/bin/bash

# Enable ingress if using Minikube
minikube addons enable ingress

# Apply all configurations
kubectl apply -f config/nginx-configmap.yaml
kubectl apply -f deployments/nginx-deployment.yaml
kubectl apply -f services/nginx-service.yaml
kubectl apply -f ingress/nginx-ingress.yaml

# Wait for ingress to be ready
echo "Waiting for ingress to be ready..."
sleep 15

# Get service URL
MINIKUBE_IP=$(minikube ip)
echo "Application deployed successfully!"
echo "Access via: http://$MINIKUBE_IP/test"
