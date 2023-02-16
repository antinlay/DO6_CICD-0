#!/bin/bash

phrase_txt=$(find $CI_PROJECT_DIR -type f -name 'phrase.txt')
pattern_txt=$(find $CI_PROJECT_DIR -type f -name 'pattern.txt')
s21_grep_c=$(find $CI_PROJECT_DIR -type f -name 's21_grep.c')
s21_grep_h=$(find $CI_PROJECT_DIR -type f -name 's21_grep.h')
s21_grep=$(find $CI_PROJECT_DIR -type f -name 's21_grep')
touch s21_grep.txt grep.txt
s21_grep_txt=$(find $CI_PROJECT_DIR -type f -name 's21_grep.txt')
grep_txt=$(find $CI_PROJECT_DIR -type f -name 'grep.txt')
arr=("-i" "-v" "-c" "-l" "-h" "-s" "-in" "-cv" "-iv" "-lv")

for flag in ${arr[*]}; do
    ./$s21_grep $flag int $s21_grep_c >> $s21_grep_txt
    grep $flag int $s21_grep_c >> $grep_txt
    if cmp -s $s21_grep_txt $grep_txt; then 
        :
    else
        echo FLAG: $flag
        diff -s $s21_grep_txt $grep_txt
    fi
    rm $s21_grep_txt $grep_txt
done
