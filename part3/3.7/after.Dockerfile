FROM node:14.17.0-alpine3.13 as builder
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . ./
RUN npm run build

FROM node:14.17.0-alpine3.13
EXPOSE 5000
WORKDIR /app
COPY --from=builder /app/app.js ./app.js
COPY --from=builder /app/dist ./dist/
RUN adduser -D appuser && npm i express
USER appuser

CMD [ "node", "app.js" ]
