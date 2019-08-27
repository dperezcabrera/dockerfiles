FROM ubuntu:18.04
LABEL maintainer "David Pérez Cabrera <dperezcabrera@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV USER ubuntu
ENV PASSWORD password
ENV HOME /home/$USER
ENV RESOLUTION 1600x900

# Create new user for vnc login.
RUN adduser $USER --disabled-password

# Install MATE and dependency component.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        tightvncserver \
	xfonts-base \
	x11-xserver-utils \
        supervisor \
        net-tools \
        wget \
        git \
        pwgen \
	sudo \
	mate-core mate-notification-daemon \
	mate-applet-appmenu mate-applet-brisk-menu mate-applets \
	mate-terminal \
        unzip \
	ca-certificates \
	dconf-cli \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /usr/share/icons/Contras*  /usr/share/icons/Humanity-Dark /usr/share/icons/menta /usr/share/icons/mate* /usr/share/icons/Fog /usr/share/icons/Quid

RUN mkdir -p /opt/ngrok && \
    git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/kanaka/websockify /opt/noVNC/utils/websockify && \
    rm -rf /opt/noVNC/.git /opt/noVNC/utils/websockify/.git

ADD config/user $HOME/.config/dconf/user
ADD config/xstartup $HOME/.vnc/xstartup
ADD config/dconf-full $HOME/dconf-full
ADD config/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD config/startup.sh /opt/startup.sh

RUN sed -i "s/%USER%/$USER/g" /etc/supervisor/conf.d/supervisor.conf && \
    sed -i "s/%USER%/$USER/g" $HOME/.vnc/xstartup

WORKDIR $HOME

EXPOSE 6080

CMD ["/bin/bash", "/opt/startup.sh"]

