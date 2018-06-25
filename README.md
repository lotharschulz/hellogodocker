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

build and run using docker:
```
$ docker build -t hellogo:0.0.1 .
$ docker run -p 1234:1234 --name hellogo hellogo:0.0.1
$ ..... Server at http://localhost:1234.
```


BASE_IMAGE=dockerhub/ghe-backup
IMAGE=$BASE_IMAGE:v.0.0.1
CACHE_IMAGE=$BASE_IMAGE:latest
docker build --cache-from $CACHE_IMAGE -t $CACHE_IMAGE -t $IMAGE -f Dockerfile .