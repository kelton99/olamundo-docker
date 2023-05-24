FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY ola-mundo.go .
RUN go build -ldflags="-w -s" ola-mundo.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
CMD ["./ola-mundo"]