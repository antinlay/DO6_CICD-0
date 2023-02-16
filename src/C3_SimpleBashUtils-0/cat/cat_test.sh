#!/bin/bash

bytes=$(find $CI_PROJECT_DIR -type f -name 'bytes.txt')
s21_cat=$(find $CI_PROJECT_DIR -type f -name 's21_cat')
touch s21_cat.txt cat.txt
s21_cat_txt=$(find $CI_PROJECT_DIR -type f -name 's21_cat.txt')
cat_txt=$(find $CI_PROJECT_DIR -type f -name 'cat.txt')
arr=("" "-b" "-e" "-n" "-s" "-t" "-ne" "-be" "-set" "-sv" "-sn" "-sb" "-nb" "-v" "-n")

for flag in ${arr[*]}; do
    $s21_cat $flag $bytes >> $s21_cat_txt
    cat $flag $bytes >> $cat_txt
    if cmp -s $s21_cat_txt $cat_txt; then 
        :
    else
        echo FLAG: $flag
        diff -s $s21_cat_txt $cat_txt
    fi
    rm $s21_cat_txt $cat_txt
done
