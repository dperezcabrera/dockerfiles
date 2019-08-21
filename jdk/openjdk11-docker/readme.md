# OpenJdK11 With Docker

## build:

```
docker build -t dperezcabrera/openjdk11-docker .
```


## Usage:

```
docker run -it --name from_host \ 
	-v /var/run/docker.sock:/var/run/docker.sock \
	dperezcabrera/openjdk11-docker \
		docker run -it --name from_container dperezcabrera/openjdk11-docker \
			java -version
```


## Output:

```
openjdk version "11.0.4" 2019-07-16
OpenJDK Runtime Environment (build 11.0.4+11-alpine-r0)
OpenJDK 64-Bit Server VM (build 11.0.4+11-alpine-r0, mixed mode)
```


## Containers:

```
$ docker ps -a

CONTAINER ID        IMAGE                             COMMAND                  CREATED              STATUS                          PORTS                              NAMES
41fcdd3f359b        dperezcabrera/openjdk11-docker    "java -version"          About a minute ago   Exited (0) About a minute ago                                      from_container
649f8421afae        dperezcabrera/openjdk11-docker    "docker run -it --na…"   About a minute ago   Exited (0) About a minute ago                                      from_host
```

