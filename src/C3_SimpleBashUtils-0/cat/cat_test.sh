#!/bin/bash

bytes=$(find $CI_PROJECT_DIR -type f -name 'bytes.txt')
s21_cat=$(find $CI_PROJECT_DIR -type f -name 's21_cat')
touch s21_cat.txt cat.txt
s21_cat_txt=$(find $CI_PROJECT_DIR -type f -name 's21_cat.txt')
cat_txt=$(find $CI_PROJECT_DIR -type f -name 'cat.txt')
#1
$s21_cat $bytes >> $s21_cat_txt
cat $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#2 -b
$s21_cat -b $bytes >> $s21_cat_txt
cat -b $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#3 -e
$s21_cat -e $bytes >> $s21_cat_txt
cat -e $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#4 -n
$s21_cat -n $bytes >> $s21_cat_txt
cat -n $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#5 -s
$s21_cat -s $bytes >> $s21_cat_txt
cat -s $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#6 -t
$s21_cat -t $bytes >> $s21_cat_txt
cat -t $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#7 -ne
$s21_cat -ne $bytes >> $s21_cat_txt
cat -ne $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#8 -bet
$s21_cat -be $bytes >> $s21_cat_txt
cat -b -e $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#9 -set
$s21_cat -set $bytes >> $s21_cat_txt
cat -set $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#10 -sv
$s21_cat -sv $bytes >> $s21_cat_txt
cat -sv $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#11 -sn
$s21_cat -sn $bytes >> $s21_cat_txt
cat -sn $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#12 -sb
$s21_cat -sb $bytes >> $s21_cat_txt
cat -sb $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#13 -nb
$s21_cat -nb $bytes >> $s21_cat_txt
cat -nb $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#14 -v
$s21_cat -v $bytes >> $s21_cat_txt
cat -v $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#15 -ne
$s21_cat -n $bytes $bytes >> $s21_cat_txt
cat -n $bytes $bytes >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
#15 -err
$s21_cat -n $bytes byte1s.txt >> $s21_cat_txt
cat -n $bytes byte1s.txt >> $cat_txt
diff -s $s21_cat_txt $cat_txt
rm $s21_cat_txt $cat_txt
