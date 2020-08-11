#!/bin/bash
cd /root
dnf -y install git
echo "${github_ssh_key}" > id_rsa_github
chmod 600 id_rsa_github
# Note: this is not very secure but will be used until this repo is public
GIT_SSH_COMMAND="ssh -i id_rsa_github -o StrictHostKeyChecking=no" git clone git@github.com:promulo/infrastructure.git
ln -s /root/infrastructure/saltstack/salt /srv/salt
rm id_rsa_github
