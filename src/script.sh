#!/bin/bash

# Before run this script needed:
# 1) Install ssh connection with HOST without password
#   - change /etc/ssh/config 
#   - ssh-keygen
#   - ssh-copy-id $REMOTE_HOST
# 2) Check ssh connect
#   - ssh $REMOTE_USER@$REMOTE_HOST
# Mac-address network adapter
REMOTE_MAC="08:00:27:79:35:c2"
# Ping all machines in network X.X.X.1 - X.X.X.254. This command add all ip in networks to list `arp -e`
fping -a -g "$IP/24" 2>/dev/null
REMOTE_HOST=$(arp -e | grep $REMOTE_MAC | awk '{print $1}');
REMOTE_USER="janiecee";
REMOTE_PSW="2121";
REMOTE_PATH="/usr/local/bin/";
# Arthefact info
ARTHEFACT_REGEX="s21_*";
ARTHEFACT_FILE=$(echo $(find . -type f -executable -name $ARTHEFACT_REGEX));

ssh-keygen -F $REMOTE_HOST > /dev/null || ssh-keyscan -t ecdsa $REMOTE_HOST >> ~/.ssh/known_hosts;

if scp $ARTHEFACT_FILE $REMOTE_USER@$REMOTE_HOST:/tmp/ > /dev/null; then
    ssh $REMOTE_USER@$REMOTE_HOST "echo $REMOTE_PSW | sudo -S mv /tmp/$ARTHEFACT_REGEX $REMOTE_PATH";
fi
