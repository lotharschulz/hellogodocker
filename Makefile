GOCMD         =go
GOBUILD       =$(GOCMD) build
GOCLEAN       =$(GOCMD) clean
GOTEST        =$(GOCMD) test
GOGET         =$(GOCMD) get
BINARY_NAME   =mybinary
BINARY_UNIX   =$(BINARY_NAME)_unix
GOPKGS        =$(shell go list ./... | grep -v /vendor/)


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
#.PHONY: size