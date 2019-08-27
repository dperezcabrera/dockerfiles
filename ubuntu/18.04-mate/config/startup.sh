#!/bin/bash

export HOME=/home/$USER

if [ ! -f $HOME/.vnc/passwd ] ; then

    echo "$USER:$PASSWORD" | chpasswd
    
    chown -R $USER:$USER $HOME
    su $USER -c "echo '$PASSWORD' | vncpasswd -f > $HOME/.vnc/passwd && chmod 600 $HOME/.vnc/passwd && touch $HOME/.Xresources"

    chown -R $USER:$USER $HOME
    if [ ! -z "$SUDO" ]; then
        case "$SUDO" in
            [yY]|[yY][eE][sS])
                adduser $USER sudo
        esac
    fi

else
    VNC_PID=`find $HOME/.vnc -name '*.pid'`
    if [ ! -z "$VNC_PID" ] ; then
        vncserver -kill :1
        rm -rf /tmp/.X1*
    fi

fi

sed -i "s/%RESOLUTION%/$RESOLUTION/g" /etc/supervisor/conf.d/supervisor.conf

/usr/bin/supervisord -n
