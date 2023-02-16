#!/bin/bash

set -e
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r src/C3_SimpleBashUtils-0/cat/s21_cat janiecee@192.168.1.2:/usr/local/bin
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r src/C3_SimpleBashUtils-0/grep/s21_grep janiecee@192.168.1.2:/usr/local/bin
# REMOTE_HOST="192.168.1.2"
# REMOTE_USER="root"
# REMOTE_PSW="2121"
# REMOTE_PATH="/usr/local/bin"

# ARTHEFACT_FILES=$(find $CI_PROJECT_DIR -type f -executable -name s21_*)
# ARTHEFACT_FILE_1="src/C3_SimpleBashUtils-0/cat/s21_cat"
# ARTHEFACT_FILE_2="src/C3_SimpleBashUtils-0/grep/s21_grep"



# echo $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

# ssh-copy-id $REMOTE_USER@$REMOTE_HOST
# ssh $REMOTE_USER@$REMOTE_HOST "echo $REMOTE_PSW | sudo chown -R $REMOTE_USER@$REMOTE_HOST /usr/local/bin"
# scp $ARTHEFACT_FILE_1 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

# scp $ARTHEFACT_FILE_2 $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

# exit 1
# output=$(clang-format -style="{$(grep ../ BasedOnStyle)}" -n $(find ../ -name *.[ch]))

# output=$(find . -name '*_test.sh' -type f -print0 | while IFS= read -r -d $'\0' file; do bash "$file"; done 2>&1)
# # output=$(bash $(find . -name 'cat_test.sh' -type f))


# if [ -n "$output" ]; then echo "$output" && exit 1; fi

# if ! [ -d "./C3_SimpleBashUtils-0" ]
# then 
#     git clone ssh://git@repos-ssh.21-school.ru:2289/students/C3_SimpleBashUtils.ID_353513/janiecee_student.21_school.ru/C3_SimpleBashUtils-0.git -b develop
# fi