#!/bin/bash

# script to test 3 dns names.

# <Variable>=<value>
# for loop
# do
# absolute path command ping
# -c = count
# 1 = once
# $<variable>
# > standard output
# dev/null = black space
#
# if statement
# []
# $?
# -eq equals 0
# then
# echo 'print'
# fi
# done





HOSTS="google.com amazon.com yahoo.com"

for HOSTS in $HOSTS
        do
    /usr/bin/ping -c 1 $HOSTS > /dev/null 2>&1
    if [ $? -eq 0 ];
    then
       echo $HOSTS 'is up!'
    else
	echo $HOSTS 'is down!'
    fi
done
