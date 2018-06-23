FROM golang:1.10.3 as builder

WORKDIR /go/src/github.com/lotharschulz/hellogodocker/

COPY hello.go	.

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hellogodocker .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/github.com/lotharschulz/hellogodocker/hellogodocker .

CMD ["./hellogodocker"]
