#!/usr/bin/env bash

[ -z "$WORK" ] && exit

docker rm -f $(docker ps -a -q)
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

docker pull postgres
docker run --restart always --name postgres -e POSTGRES_PASSWORD=petrofeed -e POSTGRES_USER=petrofeed -d -p 5432:5432 postgres
VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port5432,tcp,,5432,,5432";

docker pull mongo
docker run --restart always --restart always --name mongo -d -p 27017:27017 mongo
VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port27017,tcp,,27017,,27017";

docker pull ahmetkizilay/docker-neo4j
docker run --restart always -i -t -d -e NEO4J_AUTH=none --name neo4j --cap-add=SYS_RESOURCE -p 7474:7474 ahmetkizilay/docker-neo4j
VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port7474,tcp,,7474,,7474";
