FROM theiaide/theia:latest AS builder

LABEL maintainer "David Perez Cabrera <dperezcabrera@gmail.com>"

RUN mkdir /home/theia/agent && \
	cd /home/theia/agent && \
	npm init -y && \
	npm install http-proxy basic-auth

FROM theiaide/theia:latest

ENV USERNAME developer
ENV PASSWORD password

COPY --from=builder --chown=theia:theia /home/theia/agent /home/theia/agent

ADD proxy.js /home/theia/agent/
ADD entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER root

RUN chown -R theia:theia /usr/local/lib/node_modules 

USER theia

EXPOSE 5050

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# docker run --rm -it -p 5050:5050 -e USERNAME="developer" -e PASSWORD="password" --name theia dperezcabrera/theia:latest
