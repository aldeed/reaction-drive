############################################################
# Dockerfile to install Meteor and run Reaction Commerce
# Based on Ubuntu
############################################################

# DOCKER-VERSION: 0.10.0
FROM ubuntu
MAINTAINER Aaron Judd <aaron@ongoworks.com>

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y python g++ make nodejs

RUN npm install --silent -g forever
RUN npm uninstall fibers
RUN npm install --silent -g fibers

ADD reaction.tar.gz reaction-app

WORKDIR reaction-app
RUN ls bundle/programs/server
RUN cd bundle/programs/server && npm uninstall --silent fibers && npm install --silent fibers


ENV PORT 8080
ENV ROOT_URL http://localhost
ENV MONGO_URL mongodb://127.0.0.1:3001/meteor

EXPOSE 8080
CMD forever -w bundle/main.js