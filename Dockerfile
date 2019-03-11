FROM golang:1.12
LABEL maintainer="Lothar Schulz <http://bit.ly/2zVLbWh>"

RUN mkdir /app
WORKDIR /app
COPY hello.go	.

RUN go build -o hellogo .

RUN groupadd -g 99 appuser && useradd -r -u 99 -g appuser appuser 
USER appuser

CMD ["./hellogo"]
