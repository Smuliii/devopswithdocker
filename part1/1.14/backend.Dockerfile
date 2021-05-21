FROM ubuntu:20.04

EXPOSE 8080

WORKDIR /usr/local/app

RUN apt-get update && apt-get install -y curl
RUN curl -LO https://golang.org/dl/go1.16.4.linux-amd64.tar.gz

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz

COPY . ./

ENV PATH=$PATH:/usr/local/go/bin
ENV REQUEST_ORIGIN=http://localhost:5000
RUN go build

CMD [ "./server" ]