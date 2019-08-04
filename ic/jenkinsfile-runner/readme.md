# Jenkinsfile Runner

[See official repo](https://github.com/jenkinsci/jenkinsfile-runner)

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
docker run --rm \
	--volume $PWD/Jenkinsfile:/workspace/Jenkinsfile \
	<image-name:version> \
	-a "param1=Hello&param2=value2"
```

with docker:

```
docker run --rm \
	--volume $PWD/Jenkinsfile:/workspace/Jenkinsfile \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	<image-name:version> \
	-a "param1=Hello&param2=value2"
```

