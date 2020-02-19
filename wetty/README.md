Dockerized Wetty
================

This is a web-shell alpine image based in svenihoney/wetty ideas, dockerized version of Wetty butlerx (https://github.com/butlerx/wetty), 

This project is linked to the docker hub, so you may always pull the latest build from any docker environment.

```
docker pull dperezcabrera/wetty
```

Then you can run the application using:

```
docker run -t --rm \ 
       --publish 2222:2222 \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --env USER=user \
       --env PASSWORD=secure_password \
       --name wetty \
       --hostname wetty \
       wetty
```
The environment parameters 

- USER
- PASSWORD


You may then access the application using http://localhost:2222
With credentials: user/secure_password and then:

```
wetty:~$ git --version
git version 2.24.1
wetty:~$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND                   CREATED             STATUS              PORTS                    NAMES
009fa09ff2e1        wetty               "/bin/sh -c \"./run.s…"   32 seconds ago      Up 31 seconds       0.0.0.0:2222->2222/tcp   wetty
```


Info
----
Reference repository (https://github.com/svenihoney/docker-wetty-alpine)

