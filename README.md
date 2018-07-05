# golang hello world 
## with docker build pattern and docker cache

preconditions:
- [golang](https://golang.org/)
- [modern make](https://github.com/tj/mmake) `go get github.com/tj/mmake/cmd/mmake`
- [gopherjs](https://github.com/gopherjs/gopherjs) `go get -u github.com/gopherjs/gopherjs`
- [gopher-count](https://github.com/steveoc64/gopher-count) `go get github.com/steveoc64/gopher-count`

build:
```
$ make build
```

run:
```
$ make run
go build -o mybinary -v ./...
./mybinary
2018/06/23 09:07:25 Server at http://localhost:1234.

```

4 options of docker build
```
$ make build.docker
$ make build.docker-cache
$ make build.dockerbuilder
$ make build.dockerbuilder-cache
```


docker run
```
docker run -p 1234:1234  dockerhub/hellogo:[tag]
# e.g. docker run -p 1234:1234  dockerhub/hellogo:dd70981-dirty
```

[build.log](build.log) shows sample docker image build times