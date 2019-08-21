ARG NODE_VERSION=10
FROM node:${NODE_VERSION}-alpine AS builder

LABEL maintainer "David Perez Cabrera <dperezcabrera@gmail.com>"

RUN apk add --no-cache make gcc g++ python
WORKDIR /home/theia
ADD latest.package.json ./package.json
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

FROM node:${NODE_VERSION}-alpine

ENV HOME /home/theia
ENV USERNAME developer
ENV PASSWORD password
ENV MAVEN_VERSION 3.6.1
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH
ENV SHELL /bin/bash
ENV USE_LOCAL_GIT true

RUN addgroup theia && \
    adduser -G theia -s /bin/sh -D theia;

RUN chmod g+rw /home && \
    mkdir -p /home/project && \
    chown -R theia:theia /home/project;

RUN apk add --no-cache git openssh bash

WORKDIR /home/theia

COPY --from=builder --chown=theia:theia /home/theia /home/theia

RUN mkdir /home/theia/agent
RUN cd /home/theia/agent && npm init -y && npm install http-proxy basic-auth
ADD proxy.js /home/theia/agent

RUN apk add --no-cache openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN npm install -g node-gyp supervisor && \
	cd / && \
	npm init -y && \
	npm install socket.io ws express http-proxy bagpipe chokidar request nodemailer await-signal log4js moment

RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

RUN chown -R theia:theia /node_modules && \
	chown -R theia:theia /usr/local/lib/node_modules && \
	chown -R theia:theia /home/theia && \
	chown -R theia:theia /usr/local/bin/

USER theia

ADD entrypoint.sh /

EXPOSE 5050

CMD /entrypoint.sh

# docker run --rm -it -p 5050:5050 -e USERNAME="developer" -e PASSWORD="password" --name theia dperezcabrera/theia-java:latest

