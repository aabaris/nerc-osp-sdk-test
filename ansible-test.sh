#!/bin/bash

source /etc/profile.d/nercrc.sh
source /srv/docker-ansible/env/bin/activate

echo "### python modules ###"
pip list
echo "### galaxy collections ###"
ansible-galaxy collection list
echo "### run test playbooks ###"
ansible-playbook /ansible/test.yml
