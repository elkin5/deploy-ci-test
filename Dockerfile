FROM node:14.14.0-alpine3.10

WORKDIR /app

ADD package.json package-lock.json /app/
RUN npm install

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
