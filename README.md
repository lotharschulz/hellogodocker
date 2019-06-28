# golang hello world 

[![CircleCI](https://circleci.com/gh/lotharschulz/hellogodocker.svg?style=shield)](https://circleci.com/gh/lotharschulz/hellogodocker)

## docker images with docker build pattern, docker cache and from scratch based dockerfile

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

#### 6 main ways to build a docker image
```
$ make build.docker
$ make build.docker-cache
$ make build.dockerbuilder
$ make build.dockerbuilder-cache
$ make build.dockeralpine
$ make build.docker-min
```

###### note about ca-certificates
```
# $ make build.docker-min
# requires ca-certificates.crt file in project directory
# For many Linux distributions, 
# you can copy the file from /etc/ssl/certs/ca-certificates.crt :
cp /etc/ssl/certs/ca-certificates.crt .
```

##### [build.log](build.log) shows
- docker image build times
- docker image sizes

##### docker experimental functions

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
_Docker on Mac OS offers to set the experimental functions via UI as well. That would be Preferences->Daemon->Advanced._

##### docker run
```
docker run -p 1234:1234 -name hellogodocker lotharschulz/hellogo:[tag]
# e.g. docker run -p 1234:1234 --name hellogodocker lotharschulz/hellogo:build.docker--0.2.102
```

##### kubernetes deployment

create k8s resources
```
kubectl create -f k8s/dpl_svc.yaml --record=true
```

check k8s resources
```
kubectl get po -w                   # watch progress
kubectl get po,rs,deploy,svc        # check k8s resources
```

access the service
```
minikube service hellogo-svc
# opens the service in default browser
```
```
minikube service hellogo-svc --url
# sample output: http://192.168.99.100:30037 
curl http://192.168.99.100:30037
```

clean up
```
kubectl delete deploy,svc,po,rs -l app=hellogo
```


fix

#### blog post
[let’s go build a minimal docker image](https://www.lotharschulz.info/2018/10/01/lets-go-build-a-minimal-docker-image/)
