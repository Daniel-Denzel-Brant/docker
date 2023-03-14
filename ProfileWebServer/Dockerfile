FROM node:19-slim

COPY package.json /app/
COPY index.js /app/
COPY favicon.ico /app/
COPY public /app/public
COPY DanielWebServerFiles.zip /app/

WORKDIR /app/

RUN npm install express
RUN npm install serve-favicon

CMD npm start
