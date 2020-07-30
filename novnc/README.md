# Standalone NoVNC Container

This is a small standalone server alpine based in [dougw/novnc](https://github.com/doug-w/docker-novnc) ideas.

## Configuration

Two environment variables exist in the docker file for configuration REMOTE_HOST and REMOTE_PORT.

### Variables

**REMOTE_HOST** Host running a VNC Server to connect to - defaults to *localhost*
**REMOTE_PORT** Port that the VNC Server is listening on - defaults to *5900*

### Ports
**6080** is exposed by default.

## Usage

```
docker run -d -p 6080:6080 -e REMOTE_HOST=192.168.1.1 -e REMOTE_PORT=5900 dperezcabrera/novnc-alpine
```

### Example

```
docker run -d --name test -e VNC_NO_PASSWORD=1 selenium/standalone-chrome-debug

docker run -d --link test -p 6080:6080 -e REMOTE_HOST=test -e REMOTE_PORT=5900 dperezcabrera/novnc-alpine
```

