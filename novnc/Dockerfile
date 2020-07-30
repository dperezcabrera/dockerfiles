FROM alpine/git AS builder
LABEL maintainer "David Pérez Cabrera <dperezcabrera@gmail.com>"

RUN git clone --depth 1 https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone --depth 1 https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    rm -rf /opt/noVNC/.git /opt/noVNC/utils/websockify/.git

FROM alpine:3.12.0

ENV REMOTE_HOST localhost
ENV REMOTE_PORT 5900

RUN apk --update --upgrade add supervisor bash procps python2

COPY --from=builder /opt /opt
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
