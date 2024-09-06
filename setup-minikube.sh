#!/bin/bash

# Starta Minikube
echo "Startar Minikube..."
minikube start

# Tillämpar Kubernetes-konfigurationen
echo "Tillämpar Kubernetes-konfiguration..."
kubectl apply -f deployment.yaml
kubectl apply -f postgres-init-configmap.yaml

# Skapa Secret för databasuppgifter
echo "Skapar Secret för databasens inloggning..."
kubectl create secret generic db-secret --from-literal=POSTGRES_USER=${POSTGRES_USER} --from-literal=POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --from-literal=POSTGRES_DB=${POSTGRES_DB}


# Kontrollera status för resurser
echo "Kontrollerar status för Pods, Services och Deployments..."
kubectl get pods 
kubectl get services 
kubectl get deployments 
kubectl get pvc 

echo "Klart, tar lite tid, vänta 1min och ta en kaffe!"