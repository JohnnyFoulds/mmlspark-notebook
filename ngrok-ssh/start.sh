#!/bin/bash

# Start sshd
/usr/sbin/sshd -D &

#  set the token
ngrok authtoken $NGROKTOKEN

# start ngrok
ngrok tcp 22
