FROM docker:latest

WORKDIR /app

RUN apk update && apk add curl

COPY docker-builder ./

ENTRYPOINT [ "./docker-builder" ]
