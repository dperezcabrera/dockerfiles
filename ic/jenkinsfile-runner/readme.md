# Jenkinsfile Runner

## Info:

[See official repo](https://github.com/jenkinsci/jenkinsfile-runner)


## Build:

Basic build: 

```
docker build -t dperezcabrera/jenkinsfile-runner .
```

Custom jenkins version:

```
docker build -t dperezcabrera/jenkinsfile-runner --build-arg JENKINS_VERSION=alpine .
```

## Usage:

Basic usage:

```
docker run --rm \
	--volume $PWD/Jenkinsfile-example:/workspace/Jenkinsfile \
	dperezcabrera/jenkinsfile-runner \
	-a "param1=Hello" -a "param2=value2"
```

With docker:

```
docker run --rm \
	--volume $PWD/Jenkinsfile:/workspace/Jenkinsfile \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	dperezcabrera/jenkinsfile-runner
```

