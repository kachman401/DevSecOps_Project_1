FROM golang:1.18 AS builder

WORKDIR /app

COPY ./src/app .

RUN go build -o myapp .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/myapp .

CMD ["./myapp"]