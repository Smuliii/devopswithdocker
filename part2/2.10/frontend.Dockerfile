FROM ubuntu:20.04

EXPOSE 5000

WORKDIR /usr/local/app

RUN apt-get update && apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash && \
	apt-get install -y nodejs

COPY . ./

RUN npm install && npm install -g serve

ENV REACT_APP_BACKEND_URL=http://localhost:8080
RUN npm run build

CMD [ "serve", "-s", "-l", "5000", "build" ]
