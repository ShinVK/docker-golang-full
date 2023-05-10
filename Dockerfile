# Use uma imagem base do Go
FROM golang:latest AS builder

WORKDIR /app

COPY . .

RUN go build script.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/script .
CMD ["./script"]

# docker build -t victorshin/fullcycle .