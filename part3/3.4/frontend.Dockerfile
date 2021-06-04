FROM ubuntu:20.04

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost/api

WORKDIR /usr/local/app

RUN useradd appuser && \
	apt-get update && apt-get install -y curl && \
	curl -fsSL https://deb.nodesource.com/setup_14.x | bash && \
	apt-get install -y nodejs && \
	apt-get purge -y --auto-remove curl && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install && npm install -g serve

COPY . ./

RUN npm run build

USER appuser

CMD [ "serve", "-s", "-l", "5000", "build" ]
