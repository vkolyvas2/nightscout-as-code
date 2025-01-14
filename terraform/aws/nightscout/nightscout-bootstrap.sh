#!/bin/bash

echo "Configuring the instance environment"
echo 'export NS_API_KEY="${api_key}"' >> /home/ubuntu/.env
echo 'export NS_DOMAIN="${domain}"' >> /home/ubuntu/.env
echo 'export NS_FEATURES="${features}"' >> /home/ubuntu/.env
echo "export COMPOSE_HTTP_TIMEOUT=300" >> /home/ubuntu/.env

echo "Updating the system and installing Docker CE"
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-compose
