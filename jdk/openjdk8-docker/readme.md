## Build:

```
docker build -t dperezcabrera/openjdk8-docker .
```

## Usage:

```
docker run -it --name from_host -v /var/run/docker.sock:/var/run/docker.sock dperezcabrera/openjdk8-docker docker run -it --name from_container dperezcabrera/openjdk8-docker java -version
```


## Output:

```
openjdk version "1.8.0_212"
OpenJDK Runtime Environment (IcedTea 3.12.0) (Alpine 8.212.04-r0)
OpenJDK 64-Bit Server VM (build 25.212-b04, mixed mode)
```

## Containers:

```
$ docker ps -a

CONTAINER ID        IMAGE                             COMMAND                  CREATED              STATUS                          PORTS                              NAMES
d1d5dc973801        dperezcabrera/openjdk8-docker    "java -version"          About a minute ago   Exited (0) About a minute ago                                      from_container
8f3eb7dbbabf        dperezcabrera/openjdk8-docker    "docker run -it --na…"   About a minute ago   Exited (0) About a minute ago                                      from_host
```

