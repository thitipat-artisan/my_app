# https://hub.docker.com/_/node
FROM node:lts-alpine

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

ENV NODE_ENV=production

# Install production dependencies.
# RUN npm install --only=production
RUN npm install --only=production

# Copy local code to the container image.
# COPY ./react-app/build ./react-app

COPY ./first-react-app/build ./first-react-app/build
COPY ./server.js .

# Run the web service on container startup.
CMD [ "node", "server.js" ]