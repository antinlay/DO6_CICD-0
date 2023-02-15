#!/bin/sh

output=$(clang-format -style="{$(grep ../ BasedOnStyle)}" -n $(find ../ -name *.[ch]))

if [ -n "$output" ]; then echo "$output" && exit 1; fi

# if ! [ -d "./C3_SimpleBashUtils-0" ]
# then 
#     git clone ssh://git@repos-ssh.21-school.ru:2289/students/C3_SimpleBashUtils.ID_353513/janiecee_student.21_school.ru/C3_SimpleBashUtils-0.git -b develop
# fi