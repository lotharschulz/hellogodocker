GOCMD         		=go
GOBUILD       		=$(GOCMD) build
GOCLEAN       		=$(GOCMD) clean
GOTEST        		=$(GOCMD) test
GOGET         		=$(GOCMD) get
BINARY_NAME   		=hellogo
BINARY_UNIX   		=$(BINARY_NAME)_unix
GOPKGS        		=$(shell go list ./... | grep -v /vendor/)
# https://blog.schlomo.schapiro.org/2017/08/meaningful-versions-with-continuous.html
VERSION       		?=$(shell git describe --tags --always --dirty)$(shell /bin/date "+%Y%m%d%H%M%S")

DOCKERFILE    		?= Dockerfile
DOCKERFILEBUILDER	?= DockerfileBuilder
DOCKERFILE_FOLDER	?= .
DOCKER_BASE_IMAGE	=dockerhub/hellogo
DOCKER_IMAGE		=$(DOCKER_BASE_IMAGE):$(VERSION)
DOCKER_CACHE_IMAGE	=$(DOCKER_BASE_IMAGE):latest

# all tests and build
all: test build

#build
build: 
		$(GOBUILD) -o $(BINARY_NAME) -v

# test
test: 
		$(GOTEST) -v ./...

# lint and vet (vet in verbose mode)
check:
		golint $(GOPKGS)
		go vet -v $(GOPKGS)

# clean
clean: 
		$(GOCLEAN)
		rm -f $(BINARY_NAME)
		rm -f $(BINARY_UNIX)

# run
run:
		$(GOBUILD) -o $(BINARY_NAME) -v ./...
		./$(BINARY_NAME)

# depencies
deps:
		$(GOGET) github.com/markbates/goth
		$(GOGET) github.com/markbates/pop

# Display size of dependencies.
size:
	@gopherjs build ./*.go -m -o /tmp/out.js
	@du -h /tmp/out.js
	@gopher-count /tmp/out.js | sort -nr

# builds the docker image, depends on build
build.docker: build
	docker build --rm -t $(DOCKER_IMAGE) -f $(DOCKERFILE) $(DOCKERFILE_FOLDER)

# builds the docker image, depends on build
build.docker-cache: build
	docker build --cache-from golang:1.10.3 --cache-from alpine:latest -t $(DOCKER_IMAGE) -f $(DOCKERFILE) $(DOCKERFILE_FOLDER)

# builds the docker builder image, depends on build
build.dockerbuilder: build
	docker build --rm -t $(DOCKER_IMAGE) -f $(DOCKERFILEBUILDER) $(DOCKERFILE_FOLDER)

# builds the docker builder image, depends on build
build.dockerbuilder-cache: build
	docker build --cache-from golang:1.10.3 --cache-from alpine:latest -t $(DOCKER_IMAGE) -f $(DOCKERFILEBUILDER) $(DOCKERFILE_FOLDER)