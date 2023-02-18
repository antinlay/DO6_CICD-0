#!/bin/bash

# Before run this script need 
REMOTE_MAC="08:00:27:79:35:c2"
INTERFACE=$(ip route list | awk '/^default/ {print $5}');
IP=$(ip -o -f inet addr show $INTERFACE | awk '/scope global/ {print $4}' | cut -d/ -f1);
fping -a -g "$IP/24" > /dev/null;
REMOTE_HOST=$(arp -e | grep $REMOTE_MAC | awk '{print $1}');
REMOTE_USER="janiecee"
# REMOTE_PSW="2121"
REMOTE_PATH="/usr/local/bin/"

ARTHEFACT_FILE=$(find . -type f -executable -name s21_cat -name s21_grep)
# ARTHEFACT_FILE_2=$(find . -type f -executable -name s21_grep)

echo $ARTHEFACT_FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
# echo $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
if ! ssh-keygen -F $REMOTE_HOST > /dev/null; then 
    ssh-keyscan -t ecdsa $REMOTE_HOST >> ~/.ssh/known_hosts
fi

scp $ARTHEFACT_FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
# scp $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
