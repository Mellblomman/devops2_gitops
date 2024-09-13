#!/bin/bash

# OBS GLÖM INTE INSTALLERA HELM VIA WINDOWS POWERSHELL SOM ADMINISTRATÖR
# Steg 
# 1. Starta Powershell som administratör
# 2. Navigera till projektmappen där vi har våra skript
# 3. choco install kubernetes-helm
# 4. Efter installation, kör detta skript!

# Lägg till Helm-repositories
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Installera Prometheus och Grafana
helm install prometheus prometheus-community/kube-prometheus-stack --namespace sportcenter --create-namespace

# Vänta tills installationen är klar
echo "Väntar tills installationen är klar..."
sleep 60

# Kontrollera att pods körs
kubectl get pods -n sportcenter

# Hämta tjänsternas information
kubectl get svc -n sportcenter

# Hämta admin-lösenord för Grafana
echo "Hämtar admin-lösenord för Grafana..."
GRAFANA_PASSWORD=$(kubectl get secret -n sportcenter prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode)
echo "Grafana admin-lösenord: $GRAFANA_PASSWORD"

# Exponera Grafana via Minikube
echo "Exponerar Grafana via Minikube..."
minikube service prometheus-grafana -n sportcenter
