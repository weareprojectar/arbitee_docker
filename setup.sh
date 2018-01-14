#! /bin/bash
# install Docker on server

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

apt-get install docker-ce

apt-get install docker-compose


# run docker-compose up

docker-compose up -d
