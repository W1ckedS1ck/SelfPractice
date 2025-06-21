FROM golang AS builder
WORKDIR /app
COPY main.go .
COPY go.mod .
RUN go build -o app

FROM alpine
WORKDIR /root
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
