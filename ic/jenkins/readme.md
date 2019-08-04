# Jenkins 

[See official repo](https://github.com/jenkinsci/jenkins)

## BUILD
```
docker build -t <image-name:version> .
```

custom jenkins version:

```
docker build -t <image-name:version> --build-arg JENKINS_VERSION=alpine .
```


## EXECUTE
```
docker run --rm -it \
        --name jenkins-alpine \
        --publish 8080=8080 \
        --publish 50000=50000 \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        <image-name:version>
```

