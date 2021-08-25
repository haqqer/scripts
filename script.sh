#!/usr/bin/bash

echo -e "Welcome"

DOCKER=/usr/bin/docker
DOCKER_COMPOSE=/usr/local/bin/docker-compose
VSCODE=/usr/bin/code

echo -e "\n### Docker Installation ###"

if [ -f "$DOCKER" ]; then
	echo "Docker has installed"
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
	echo "Docker Compose has installed"
else
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	echo "Docker Compose installation done"
fi

echo -e "\n### VSCode Installation ###"

if [ -f "$VSCODE" ]; then
	echo "VSCode has installed"
else 
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg	
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code
fi	
echo -e "\nAll installation completed"
