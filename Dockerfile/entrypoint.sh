#!/usr/bin/env bash

# create /var/log/auth.log if not exist
if [[ ! -f /var/log/auth.log ]]
then
    sudo touch /var/log/auth.log
fi

# start ssh service
ssh-keygen -A
/usr/sbin/sshd

# start httpd service
/usr/sbin/httpd

tail -f /var/log/auth.log
