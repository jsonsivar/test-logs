FROM node:12.16.1-alpine

# creates working directory
# this only runs inside the container, your local drive wont have this
# this is also a transient location that dies if you remove the container
# if you want to persist a folder from your local directory look into 
# volumes
WORKDIR /usr/src/app

# the only reason they do this before copying everything is 
# to take advantage of docker caches (ie dont reinstall modules
# unless package.json changes)
COPY package*.json ./

RUN npm install

# this is where you copy your code into the docker
# working directory. since its not persistent chances
# inside the docker container wont touch your source
# files outside
COPY . .

# need to expose any ports you want the outside world to access
# e.g., your browser
EXPOSE 3000

CMD [ "node", "simple-server.js" ]