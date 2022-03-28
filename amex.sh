#!/bin/bash

# time and date variables

systme="$(date +%H:%M)"
sysdate="$(date +%F)"

# cycle times variables

US23="00:30"
US24="03:00"
US05="05:00"
US17="17:00"

CA24="04:00"

ALL="$US23 US24 US05 US17 CA24"

if [[ "$1=US23" || "$1=ALL" ]] ;

then

        echo ""


if [[ "$systme" < "$*" ]]; then

        echo "Hi, window is $1, the time is $systme and the date is $sysdate"
else

        echo "syntax is incorrect"


fi

fi
