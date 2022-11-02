FROM golang:1.19-alpine as build-env

ENV APP_NAME hellogo
ENV CMD_PATH main.go

COPY . $GOPATH/src/$APP_NAME
WORKDIR $GOPATH/src/$APP_NAME

RUN CGO_ENABLE=0 go build -v -o /$APP_NAME $GOPATH/src/$APP_NAME/$CMD_PATH

FROM golang:1.19-alpine 

ENV APP_NAME hellogo

COPY --from=build-env /$APP_NAME .

CMD ./$APP_NAME