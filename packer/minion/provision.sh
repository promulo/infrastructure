#!/bin/sh
dnf -y upgrade --refresh
dnf -y install salt-minion
systemctl enable salt-minion
