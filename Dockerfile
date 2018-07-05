FROM golang:1.10.3 as builder

COPY hellogo .

CMD ["./hellogo"]
