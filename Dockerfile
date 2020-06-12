FROM python:3.8-slim-buster
FROM php:7.4-cli
FROM node:14
WORKDIR /usr/src/app
# copy package.json
COPY package*.json ./
COPY client/package*.json ./client/
RUN npm install \
   && cd client \
   && npm i yarn \
   && yarn add react \
   && yarn build \
COPY . .
# builing Angular UI
# RUN cd client && yarn build
EXPOSE 3070
ENTRYPOINT ["node"]
CMD ["server.js"]
