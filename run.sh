#!/bin/sh

APP_CREDFILE=~/app-cred-aa-openrc.sh

podman run -it --rm -v $APP_CREDFILE:/etc/profile.d/nercrc.sh:ro,Z -v ./ansible:/ansible:ro,Z localhost/ansible-test /ansible/ansible-test.sh
