FROM node:10-alpine
LABEL maintainer "David Pérez Cabrera <dperezcabrera@gmail.com>"

WORKDIR /app

ENV USER user
ENV PASSWORD "" 

RUN apk add --no-cache --virtual .build-deps \
  python make g++ \
  && apk add --no-cache --update openssh docker git sudo \
  && git clone https://github.com/butlerx/wetty --branch v1.3.0 /app \
  && npm install \
  && apk del .build-deps \
  && adduser -h /src -D term \
  && npm run-script build \
  && echo "Set disable_coredump false">/etc/sudo.conf

ADD run.sh /app

EXPOSE 2222

ENTRYPOINT "./run.sh"

