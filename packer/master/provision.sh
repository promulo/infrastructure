#!/bin/sh
dnf -y upgrade --refresh
dnf -y install salt-master salt-minion
systemctl enable salt-master
systemctl enable salt-minion
