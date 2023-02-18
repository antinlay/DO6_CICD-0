#!/bin/bash

REMOTE_MAC="08:00:27:79:35:c2"
INTERFACE=$(ip route list | awk '/^default/ {print $5}');
IP=$(ip -o -f inet addr show $INTERFACE | awk '/scope global/ {print $4}' | cut -d/ -f1);

REMOTE_HOST=$(arp-scan --interface=$INTERFACE --localnet | grep $REMOTE_MAC | awk '{print $1}');
REMOTE_USER="janiecee"
# REMOTE_PSW="2121"
REMOTE_PATH="/usr/local/bin/"

ARTHEFACT_FILE_1=$(find . -type f -executable -name s21_cat)
ARTHEFACT_FILE_2=$(find . -type f -executable -name s21_grep)

# echo $ARTHEFACT_FILE_1 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
# echo $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

scp $ARTHEFACT_FILE_1 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
scp $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
