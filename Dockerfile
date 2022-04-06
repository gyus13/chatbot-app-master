FROM node:16-alpine
WORKDIR /usr/src/app
COPY package.json .
RUN yarn --ignore-scripts
COPY . .
RUN yarn build
EXPOSE 5000
CMD [ "npm", "start" ]