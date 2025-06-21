FROM golang:1.22.2 AS builder
WORKDIR /app

COPY go.mod .
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o app

FROM alpine
WORKDIR /root
COPY --from=builder /app/app .

EXPOSE 8080
CMD ["./app"]
