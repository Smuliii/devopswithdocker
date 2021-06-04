FROM node:16.3.0-alpine3.13 AS builder

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost/api

WORKDIR /usr/local/app

COPY package*.json ./

RUN npm install

COPY . ./

RUN npm run build

FROM node:16.3.0-alpine3.13

COPY --from=builder /usr/local/app/build ./build/

RUN adduser -D appuser && \
	npm install -g serve

USER appuser

CMD [ "serve", "-s", "-l", "5000", "build" ]
