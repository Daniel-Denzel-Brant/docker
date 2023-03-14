FROM node:19-slim

COPY package.json /app/
COPY src /app/

WORKDIR /app/

RUN npm install

CMD npm start
