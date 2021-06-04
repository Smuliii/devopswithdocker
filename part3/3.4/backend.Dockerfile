FROM ubuntu:20.04

EXPOSE 8080

ENV PATH=$PATH:/usr/local/go/bin
ENV REQUEST_ORIGIN=http://localhost

WORKDIR /usr/local/app

RUN useradd appuser && \
	apt-get update && apt-get install -y curl && \
	curl -LO https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
	apt-get purge -y --auto-remove curl && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . ./

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz && \
	rm go1.16.4.linux-amd64.tar.gz && \
	go build && go clean -cache -modcache && rm -rf /usr/local/go

USER appuser

CMD [ "./server" ]
