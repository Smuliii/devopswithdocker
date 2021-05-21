FROM node:14.17.0

EXPOSE 5000

WORKDIR /app

RUN git clone https://github.com/Smuliii/fullstackopen-pokedex.git . && rm -rf .git

RUN npm install
RUN npm run build

CMD [ "npm", "run", "start-prod" ]