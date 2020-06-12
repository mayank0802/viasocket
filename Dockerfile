FROM python:3.8-slim-buster
FROM php:7.4-cli
FROM node:14 
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install
CMD [ "node", "server.js" ]
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
#FROM php:7.4-cli
FROM php:7.4-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

FROM php:7.4-cli
RUN docker-php-source extract \
    # do important things \
    && docker-php-source delete
EXPOSE 8080
#CMD ["/start.sh"]
