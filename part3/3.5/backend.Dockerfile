FROM golang:1.16.5-alpine3.13

EXPOSE 8080

ENV PATH=$PATH:/usr/local/go/bin
ENV REQUEST_ORIGIN=http://localhost

WORKDIR /usr/local/app

COPY . ./

RUN adduser -D appuser && \
	go build && go clean -cache -modcache && rm -rf /usr/local/go

USER appuser

CMD [ "./server" ]
