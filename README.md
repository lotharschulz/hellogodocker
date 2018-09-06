# golang hello world 

[![CircleCI](https://circleci.com/gh/lotharschulz/hellogodocker.svg?style=shield)](https://circleci.com/gh/lotharschulz/hellogodocker)

## with minimum dockerfile, docker build pattern and docker cache

#### preconditions
- [golang](https://golang.org/)
- [modern make](https://github.com/tj/mmake) `go get github.com/tj/mmake/cmd/mmake`
- [gopherjs](https://github.com/gopherjs/gopherjs) `go get -u github.com/gopherjs/gopherjs`
- [gopher-count](https://github.com/steveoc64/gopher-count) `go get github.com/steveoc64/gopher-count`

#### build
```
$ make build
```

#### run
```
$ make run
go build -o mybinary -v ./...
./mybinary
2018/06/23 09:07:25 Server at http://localhost:1234.

```

#### 5 ways to build a docker image
```
$ make build.docker
$ make build.docker-cache
$ make build.dockerbuilder
$ make build.dockerbuilder-cache
$ make build.dockerbuilder-min
```

###### note about ca-certificates
```
# $ make build.dockerbuilder-min
# requires ca-certificates.crt file in project directory
# For many Linux distributions, 
# you can copy the file from /etc/ssl/certs/ca-certificates.crt :
cp /etc/ssl/certs/ca-certificates.crt .
```

##### [build.log](build.log) shows
- docker image build times
- docker image sizes

##### docker run
```
docker run -p 1234:1234 dockerhub/hellogo:[tag] -name hellogodocker
# e.g. docker run -p 1234:1234 dockerhub/hellogo:dd70981-dirty20180710223321 -name hellogodocker
```

##### docker experimantal

In order to run the _squash_ build commands above, you need to run the docker deamon with experimental functions:
```
$ cat <<EOT >> /etc/docker/daemon.json
{ 
    "experimental": true 
} 
EOT
$ sudo service docker restart

#check result
$ docker version -f '{{.Server.Experimental}}'
true
```