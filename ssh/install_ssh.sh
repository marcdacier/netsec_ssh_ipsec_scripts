#!/bin/sh
apk add openrc --no-cache
apk add openssh --no-cache
rc-update add sshd
rc-status
touch /run/openrc/softlevel
/etc/init.d/sshd restart