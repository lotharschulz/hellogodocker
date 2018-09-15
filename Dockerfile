FROM golang:1.11

RUN groupadd -g 999 appuser && useradd -r -u 999 -g appuser appuser
USER appuser

WORKDIR /app

COPY hellogo .

CMD ["./hellogo"]
