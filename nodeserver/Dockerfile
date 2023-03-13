FROM node:19-slim

COPY package.json /app/
COPY src /app/

WORKDIR /app/

RUN npm install express
RUN npm install -g npm@9.6.0

CMD node server.js
