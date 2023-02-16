#!/bin/bash

# output=$(clang-format -style="{$(grep ../ BasedOnStyle)}" -n $(find ../ -name *.[ch]))

output=$(find . -name '*_test.sh' -type f -print0 | while IFS= read -r -d $'\0' file; do bash "$file"; done 2>&1)
# output=$(bash $(find . -name 'cat_test.sh' -type f))


if [ -n "$output" ]; then echo "$output" && exit 1; fi

# if ! [ -d "./C3_SimpleBashUtils-0" ]
# then 
#     git clone ssh://git@repos-ssh.21-school.ru:2289/students/C3_SimpleBashUtils.ID_353513/janiecee_student.21_school.ru/C3_SimpleBashUtils-0.git -b develop
# fi