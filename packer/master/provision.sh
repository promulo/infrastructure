#!/bin/sh
dnf -y upgrade --refresh
dnf -y install salt-master
systemctl enable salt-master
