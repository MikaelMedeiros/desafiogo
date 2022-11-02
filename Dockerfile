FROM golang:1.19-alpine as build-env

COPY . $GOPATH/src/hellogo
WORKDIR $GOPATH/src/hellogo

RUN CGO_ENABLE=0 go build -o /hellogo

FROM scratch

COPY --from=build-env /hellogo .

CMD ["./hellogo"]