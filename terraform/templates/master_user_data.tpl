#!/bin/bash
cd /root
dnf -y install git
echo "${github_ssh_key}" > /tmp/id_rsa_github
ssh-add /tmp/id_rsa_github
# Note: this is not very secure but will be used until this repo is public
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:promulo/infrastructure.git
ln -s /root/infrastructure/saltstack/salt /srv/salt
rm /tmp/id_rsa_github
