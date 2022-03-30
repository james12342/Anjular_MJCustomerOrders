FROM node:16.13.2-alpine

LABEL author="James Huang"

ENV CONTAINER=true

WORKDIR /var/www/node-service

COPY package.json package-lock.json ./
RUN npm install --only=prod --no-optional

COPY ./server.js .
COPY ./api .
COPY ./data .

EXPOSE 8089

ENTRYPOINT ["node", "server.js"]