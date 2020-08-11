#!/bin/bash
echo "${github_ssh_key}" >> id_rsa_github
ssh-add id_rsa_github
git clone git@github.com:promulo/infrastructure.git
ln -s infrastructure/saltstack/salt /srv/salt
rm id_rsa_github
