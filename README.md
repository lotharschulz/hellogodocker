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

docker build
```
$ make build.docker
go build -o hellogo -v
.....
```

```
$ make build.docker-cache
go build -o hellogo -v
......
```