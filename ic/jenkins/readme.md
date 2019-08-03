# BUILD
```
    docker build -t <image-name:version> .
```


# EXECUTE
```
    docker run --rm -it \
        --name jenkins-alpine \
        --publish 8080=8080 \
        --publish 50000=50000 \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        <image-name:version>
```

