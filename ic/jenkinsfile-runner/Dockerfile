ARG JENKINS_VERSION=alpine

FROM jenkins/jenkins:${JENKINS_VERSION} AS builder
LABEL maintainer "dperezcabrera@gmail.com"

USER root

ENV JENKINSFILE_RUNNER_VERSION="1.0-beta-9"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ADD https://repo.jenkins-ci.org/releases/io/jenkins/jenkinsfile-runner/jenkinsfile-runner/$JENKINSFILE_RUNNER_VERSION/jenkinsfile-runner-$JENKINSFILE_RUNNER_VERSION-app.zip /

RUN unzip jenkinsfile-runner-$JENKINSFILE_RUNNER_VERSION-app.zip -d app \
	&& chmod +x /app/bin/jenkinsfile-runner \
	&& mkdir /jenkins-war \
	&& unzip /usr/share/jenkins/jenkins.war -d /jenkins-war \
	&& sed -i 's/$JAVA_OPTS/$JAVA_OPTS -Dhudson.model.ParametersAction.keepUndefinedParameters=true/g' /app/bin/jenkinsfile-runner \
	&& rm /app/bin/jenkinsfile-runner.bat


FROM openjdk:8-jdk-alpine

RUN apk update && apk upgrade && apk add --no-cache docker git

COPY --from=builder /jenkins-war /jenkins-war
COPY --from=builder /app /app
COPY --from=builder /usr/share/jenkins/ref/plugins /usr/share/jenkins/ref/plugins
COPY Jenkinsfile-example /workspace/Jenkinsfile

ENTRYPOINT ["/app/bin/jenkinsfile-runner", \
            "--jenkins-war", "/jenkins-war", \
            "--plugins", "/usr/share/jenkins/ref/plugins", \
            "--file", "/workspace", \
            "--no-sandbox"]


