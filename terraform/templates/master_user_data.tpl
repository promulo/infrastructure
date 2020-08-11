#!/bin/bash
cd /root
dnf -y install git
echo "${github_ssh_key}" > /tmp/id_rsa_github
ssh-add /tmp/id_rsa_github
git clone git@github.com:promulo/infrastructure.git
ln -s /root/infrastructure/saltstack/salt /srv/salt
rm /tmp/id_rsa_github
