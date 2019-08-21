#! /bin/bash

nohup node /home/theia/agent/proxy.js > /tmp/proxy.out &

nohup node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --startup-timeout=-1 --inspect=0.0.0.0:9229 > /tmp/theia.out

