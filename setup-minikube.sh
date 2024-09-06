#!/bin/bash

# Ladda miljövariabler från .env fil
echo "Laddar miljövariabler från .env-fil..."
source .env

# Starta Minikube
echo "Startar Minikube..."
minikube start

# Skapa namespace om det inte redan finns
echo "Skapar namespace 'sportcenter' om det inte finns..."
kubectl create namespace sportcenter --dry-run=client -o yaml | kubectl apply -f -

# Tillämpar Kubernetes-konfigurationen
echo "Tillämpar Kubernetes-konfiguration..."
kubectl apply -f deployment.yaml -n sportcenter
kubectl apply -f postgres-init-configmap.yaml -n sportcenter

# Skapa Secret för databasuppgifter
echo "Skapar Secret för databasens inloggning..."
kubectl create secret generic db-secret -n sportcenter --from-literal=POSTGRES_USER=${POSTGRES_USER} --from-literal=POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --from-literal=POSTGRES_DB=${POSTGRES_DB}


# Kontrollera status för resurser
echo "Kontrollerar status för Pods, Services och Deployments..."
kubectl get pods -n sportcenter
kubectl get services -n sportcenter
kubectl get deployments -n sportcenter
kubectl get pvc -n sportcenter 

echo "Klart, tar lite tid, vänta 1min och ta en kaffe!"