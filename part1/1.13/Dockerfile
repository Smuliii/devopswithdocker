FROM ubuntu:20.04

EXPOSE 8080

WORKDIR /usr/local/app

RUN apt-get update && apt-get install -y curl
RUN curl -LO https://golang.org/dl/go1.16.4.linux-amd64.tar.gz

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

COPY . ./

RUN go build

CMD [ "./server" ]