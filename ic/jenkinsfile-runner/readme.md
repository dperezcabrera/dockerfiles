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
docker run --rm --name jenkinsfile-runner \
	--volume $PWD/Jenkinsfile-example:/workspace/Jenkinsfile \
	dperezcabrera/jenkinsfile-runner \
	-a "param1=Hello" -a "param2=value2"
```

With docker:

```
docker run --rm --name jenkinsfile-runner \
	--volume $PWD/Jenkinsfile-docker:/workspace/Jenkinsfile \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	dperezcabrera/jenkinsfile-runner
```


## Output:

Basic usage:

```
Started
Running in Durability level: PERFORMANCE_OPTIMIZED
[Pipeline] Start of Pipeline
GOT CONTEXT FOR Build
[Pipeline] node
Running on Jenkins in /tmp/jenkinsfileRunner.tmp/jfr5222219301250325656.run/workspace/job
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] echo
Hello world!
[Pipeline] echo
message: Hello
[Pipeline] echo
param2: value2
[Pipeline] sh
+ ls -la
total 16
drwxr-xr-x    2 root     root          4096 Aug 21 11:25 .
drwxr-xr-x    4 root     root          4096 Aug 21 11:25 ..
-rw-r--r--    1 1000     1000           460 Aug  4 14:22 Jenkinsfile
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

With docker:

```
Started
Running in Durability level: PERFORMANCE_OPTIMIZED
[Pipeline] Start of Pipeline
GOT CONTEXT FOR Example
[Pipeline] node
Running on Jenkins in /tmp/jenkinsfileRunner.tmp/jfr1733784191331772310.run/workspace/job
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Example)
[Pipeline] sh
+ docker ps
CONTAINER ID        IMAGE                              COMMAND                  CREATED             STATUS              PORTS               NAMES
b126767cf7fa        dperezcabrera/jenkinsfile-runner   "/app/bin/jenkinsfil…"   12 seconds ago      Up 11 seconds                           jenkinsfile-runner
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

