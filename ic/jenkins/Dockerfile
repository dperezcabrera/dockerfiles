FROM jenkins/jenkins:alpine
LABEL maintainer="dperezcabrera@gmail.com"

USER root
RUN apk update && apk upgrade || apk add --no-cache docker

USER jenkins
COPY --from=builder plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

