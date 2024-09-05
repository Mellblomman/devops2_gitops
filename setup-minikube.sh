#!/bin/bash

# Starta Minikube
echo "Startar Minikube..."
minikube start

# Tillämpar Kubernetes-konfigurationen
echo "Tillämpar Kubernetes-konfiguration..."
kubectl apply -f deployment.yaml
kubectl apply -f postgres-init-configmap.yaml

# Kontrollera status för resurser
echo "Kontrollerar status för Pods, Services och Deployments..."
kubectl get pods 
kubectl get services 
kubectl get deployments 
kubectl get pvc 

echo "Klart, tar lite tid, vänta 1min och ta en kaffe!"