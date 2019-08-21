#! /bin/bash

node /home/theia/agent/proxy.js > /tmp/proxy.out &

node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --startup-timeout=-1 --inspect=0.0.0.0:9229 > /tmp/theia.out 2>/tmp/theia.err

