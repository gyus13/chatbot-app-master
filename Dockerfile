FROM node:alpine
WORKDIR /usr/src/app
COPY package.json .
RUN yarn install --ignore-engines
COPY . .
RUN yarn build
EXPOSE 5000
CMD [ "npm", "start" ]