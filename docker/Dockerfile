FROM node:19-alpine
 
WORKDIR /app/

COPY package.json /app/
COPY src /app/

RUN npm install

CMD ["node", "server.js"]
