# Theia-IDE

## Info:

Based on:

* [theiaide](https://github.com/theia-ide/theia-apps/) 
* [land007](https://github.com/land007/docker_theia)


## Build:

```
docker build -t dperezcabrera/theia .
```


## Usage:

```
docker run -it --rm -p 5050:5050 -e USERNAME="developer" -e PASSWORD="password" --name theia dperezcabrera/theia
```

