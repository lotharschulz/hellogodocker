#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

docker pull golang:1.12
time make build.docker
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest
time make build.docker-cache
docker images
docker rmi -f $(docker images -q)

# docker builder
docker pull golang:1.12
docker pull alpine:latest

time make build.dockerbuilder
docker images
docker rmi -f $(docker images -q)


docker pull golang:1.12
docker pull alpine:latest
time make build.dockerbuilder-cache
docker images
docker rmi -f $(docker images -q)

time make build.dockerbuilder-nocache
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest
time make build.dockerbuilder-squash
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest

time make build.dockerbuilder-compress
docker images
docker rmi -f $(docker images -q)

# alpine
docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine-cache
docker images
docker rmi -f $(docker images -q)

time make build.dockeralpine-nocache
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest

time make build.dockeralpine-squash
docker images
docker rmi -f $(docker images -q)

docker pull golang:1.12
docker pull alpine:latest

time make build.dockeralpine-compress
docker images
docker rmi -f $(docker images -q)

# min
time make build.docker-min
docker images
docker rmi -f $(docker images -q)

time make build.docker-min-nocache
docker images
docker rmi -f $(docker images -q)

time make build.docker-min-squash
docker images
docker rmi -f $(docker images -q)

time make build.docker-min-compress
docker images
docker rmi -f $(docker images -q)