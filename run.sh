#!/bin/sh

if [ -z "$APP_CREDFILE" ]; then
	APP_CREDFILE=~/app-cred.sh
fi

if [ ! -f $APP_CREDFILE ]; then
	echo "ERROR: please specify application cred file as APP_CREDIFLE env"
fi

podman run -it --rm -v $APP_CREDFILE:/etc/profile.d/nercrc.sh:ro,Z -v ./ansible:/ansible:ro,Z localhost/ansible-test-aa /ansible/ansible-test.sh
