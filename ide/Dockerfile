FROM theiaide/theia:latest

LABEL maintainer "David Perez Cabrera <dperezcabrera@gmail.com>"

ENV USERNAME=developer
ENV PASSWORD=password
ENV MAVEN_VERSION 3.6.1
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

RUN mkdir /home/theia/agent
RUN cd /home/theia/agent && npm init -y && npm install http-proxy basic-auth
ADD proxy.js /home/theia/agent

USER root
RUN apk add --no-cache openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN npm install -g node-gyp supervisor && cd / && npm init -y && npm install socket.io ws express http-proxy bagpipe chokidar request nodemailer await-signal log4js moment
RUN chown -R theia:theia /node_modules && chown -R theia:theia /usr/local/lib/node_modules && chown -R theia:theia /home/theia/.npm && chown -R theia:theia /usr/local/bin/

RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

USER theia
ADD entrypoint.sh /

ENTRYPOINT []

EXPOSE 5050

CMD /entrypoint.sh

# docker run --rm -it -p 5050:5050 -e USERNAME="developer" -e PASSWORD="password" --name theia dperezcabrera/theia-java:latest

