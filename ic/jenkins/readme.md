# Jenkins 

## Info:

[See official repo](https://github.com/jenkinsci/jenkins)


## Build:

Basic build: 

```
docker build -t dperezcabrera/jenkins .
```

Custom jenkins version:

```
docker build -t dperezcabrera/jenkins --build-arg JENKINS_VERSION=alpine .
```


## Usage:

```
docker run --rm -it \
        --name jenkins-alpine \
        --publish 8080=8080 \
        --publish 50000=50000 \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        dperezcabrera/jenkins
```

