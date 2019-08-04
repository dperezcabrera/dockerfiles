ARG JENKINS_VERSION=alpine

FROM jenkins/jenkins:${JENKINS_VERSION}
LABEL maintainer="dperezcabrera@gmail.com"

USER root
RUN apk update && apk upgrade && apk add --no-cache docker

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY disable-plugin-install-wizard.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY setup-default-security.groovy /usr/share/jenkins/ref/init.groovy.d/

