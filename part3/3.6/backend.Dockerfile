FROM golang:1.16.5-alpine3.13 AS builder

ENV PATH=$PATH:/usr/local/go/bin

WORKDIR /usr/local/app

COPY . ./

RUN adduser -D appuser && \
	CGO_ENABLED=0 go build

FROM scratch

EXPOSE 8080

ENV REQUEST_ORIGIN=http://localhost

WORKDIR /

COPY --from=builder /usr/local/app/server /server
COPY --from=builder /etc/passwd /etc/passwd

USER appuser

CMD [ "/server" ]
