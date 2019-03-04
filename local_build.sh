#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# build.docker: build
docker pull golang:1.12
time make build.docker
docker images
docker rmi -f $(docker images -q)

# build.docker-cache
docker pull golang:1.12
docker pull alpine:latest
time make build.docker-cache
docker images
docker rmi -f $(docker images -q)

######## builder pattern
# build.dockerbuilder
docker pull golang:1.12
docker pull alpine:latest

time make build.dockerbuilder
docker images
docker rmi -f $(docker images -q)

# build.dockerbuilder-cache
docker pull golang:1.12
docker pull alpine:latest
time make build.dockerbuilder-cache
docker images
docker rmi -f $(docker images -q)

# build.dockerbuilder-nocache
time make build.dockerbuilder-nocache
docker images
docker rmi -f $(docker images -q)

# build.dockerbuilder-squash
docker pull golang:1.12
docker pull alpine:latest
time make build.dockerbuilder-squash
docker images
docker rmi -f $(docker images -q)

# build.dockerbuilder-compress
docker pull golang:1.12
docker pull alpine:latest
time make build.dockerbuilder-compress
docker images
docker rmi -f $(docker images -q)

######## alpine
# build.dockeralpine
docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine
docker images
docker rmi -f $(docker images -q)

# build.dockeralpine-cache
docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine-cache
docker images
docker rmi -f $(docker images -q)

# build.dockeralpine-nocache
time make build.dockeralpine-nocache
docker images
docker rmi -f $(docker images -q)

# build.dockeralpine-squash
docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine-squash
docker images
docker rmi -f $(docker images -q)

# build.dockeralpine-compress
docker pull golang:1.12
docker pull alpine:latest
time make build.dockeralpine-compress
docker images
docker rmi -f $(docker images -q)

######## min
# build.docker-min
time make build.docker-min
docker images
docker rmi -f $(docker images -q)

# build.docker-min-nocache
time make build.docker-min-nocache
docker images
docker rmi -f $(docker images -q)

# build.docker-min-squash
time make build.docker-min-squash
docker images
docker rmi -f $(docker images -q)

# build.docker-min-compress
time make build.docker-min-compress
docker images
docker rmi -f $(docker images -q)