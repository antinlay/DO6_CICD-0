#!/bin/bash

REMOTE_HOST="192.168.179.159"
REMOTE_USER="janiecee"
# REMOTE_PSW="2121"
REMOTE_PATH="/usr/local/bin/"

ARTHEFACT_FILE_1=$(find . -type f -executable -name s21_cat)
ARTHEFACT_FILE_2=$(find . -type f -executable -name s21_grep)

# echo $ARTHEFACT_FILE_1 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
# echo $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

scp $ARTHEFACT_FILE_1 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
scp $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
