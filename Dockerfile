FROM golang:1.10.3 as builder

RUN groupadd -g 999 appuser && useradd -r -u 999 -g appuser appuser
USER appuser

WORKDIR /app

COPY hellogo .

CMD ["./hellogo"]
