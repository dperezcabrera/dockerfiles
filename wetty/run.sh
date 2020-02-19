#!/bin/sh

adduser $USER --disabled-password

export HOME=/home/$USER

if [ "$PASSWORD"  == "" ]; then
	PASSWORD=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;`
	echo "

		Generated password for user $USER: $PASSWORD

	"
else
	echo "password: '$PASSWORD'"
fi

echo "$USER:$PASSWORD" | chpasswd
chown -R $USER:$USER $HOME
/usr/sbin/addgroup $USER docker

echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER
chmod 0440 /etc/sudoers.d/$USER


if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
	# generate fresh rsa key
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
	# generate fresh dsa key
	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

/usr/sbin/sshd -D & 

su -c "npm start -- -p 2222 --sshhost localhost --sshport 22 --base / --sshuser $USER" term

