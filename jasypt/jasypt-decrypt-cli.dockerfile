FROM busybox:latest AS builder
LABEL maintainer="dperezcabrera@gmail.com"

ENV JASYPT_VERSION "1.9.3"

ADD https://github.com/jasypt/jasypt/releases/download/jasypt-${JASYPT_VERSION}/jasypt-${JASYPT_VERSION}-dist.zip /

RUN unzip jasypt-${JASYPT_VERSION}-dist.zip
RUN mv /jasypt-${JASYPT_VERSION}/lib/jasypt-${JASYPT_VERSION}.jar /jasypt.jar

FROM openjdk:8-jre-alpine

ENV ALGORITHM PBEWithMD5AndDES
ENV MASTER_KEY supersecret
ENV ENCRYPTED_PASSWORD secret

COPY --from=builder /jasypt.jar /app/jasypt.jar

CMD java -Djava.security.egd=file:/dev/./urandom -cp /app/jasypt.jar org.jasypt.intf.cli.JasyptPBEStringDecryptionCLI input="$ENCRYPTED_PASSWORD" password="$MASTER_KEY" algorithm="$ALGORITHM"

