FROM golang:1.20.1 as builder

WORKDIR /app

COPY ./src ./

RUN go build

ENTRYPOINT ["./fullcycle"]

FROM scratch

WORKDIR /app

COPY --from=builder /app/fullcycle ./

ENTRYPOINT ["./fullcycle"]
