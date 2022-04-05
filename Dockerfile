FROM node:10
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run --script build
EXPOSE 5000
CMD [ "npm", "run", "start"  ]
