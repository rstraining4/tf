FROM node:latest
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./app
RUN npm install
RUN chmod +x ./app
ENTRYPOINT ["./app"]
# If you are building your code for production
# RUN npm install --only=production
# Bundle app source
#COPY . .
COPY . /app
EXPOSE 8080
CMD [ "npm", "start" ]
