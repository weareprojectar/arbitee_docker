#! /bin/bash
# Docker updater
# @Author  wonseok
# @date    2017/1/15
# @details finding better way (now)

# install Docker on server
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
apt-get install docker-compose


#remove all containers - by wonseok (2017/01/15)
docker rm -f $(docker ps -a -q)
for f in `docker images | grep -v IMAGE | awk '{split($0,array," ")} {print array[3]}'`
do 
 echo "==> delete image : $f"
 docker rmi $f 
done


# create necessary images
docker build --tag node-nginx:test .
cd nginx
docker build --tag node-nginx-lb:test .
cd ../

# run docker-compose up
docker-compose up -d
