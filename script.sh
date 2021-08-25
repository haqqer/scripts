#!/usr/bin/bash

echo -e "Welcome"

DOCKER=/usr/bin/docker
DOCKER_COMPOSE=/usr/local/bin/docker-compose

echo -e "\n### Docker Installation ###"

if [ -f "$DOCKER" ]; then
	echo "Docker has been exist!"
else
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	sudo groupadd docker
	sudo usermod -aG docker $USER
	echo "Docker installation done"
fi

echo -e "\n### Docker Compose Installation ###"

if [ -f "$DOCKER_COMPOSE" ]; then
	echo "Docker Compose has been exist"
else
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	echo "Docker Compose installation done"
fi

echo "All installation completed"
