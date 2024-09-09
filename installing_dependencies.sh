#!/bin/bash

# Logga in i Jenkins Docker-container som root-användare
CONTAINER_NAME="jenkins"
docker exec -u 0 -it $CONTAINER_NAME bash -c "

# Uppdatera paketlistan
apt update

# Installera Python 3 och pip
apt install -y python3 python3-pip

# Installera och uppdatera pytest
pip3 install -U pytest --break-system-packages

# Installera python venv
apt install python3.11-venv -y

# Installera Docker
apt install -y docker.io

# Lägg till Jenkins-användaren i Docker-gruppen för att köra Docker-kommandon utan sudo
usermod -aG docker jenkins

# Installera Docker Compose
apt install -y docker-compose

# Ändra behörigheterna för Docker-socket så att Jenkins kan komma åt den
chmod 666 /var/run/docker.sock

# Bekräfta installationerna
echo 'Installationen är klar. Docker, Python och relaterade verktyg har installerats.'

# Exit från container
exit
"

echo "Allt installerat för Jenkins i docker container"
