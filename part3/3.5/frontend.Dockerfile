FROM node:16.3.0-alpine3.13

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost/api

WORKDIR /usr/local/app

COPY package*.json ./

RUN adduser -D appuser && \
	npm install && npm install -g serve

COPY . ./

RUN npm run build

USER appuser

CMD [ "serve", "-s", "-l", "5000", "build" ]
