#!/usr/bin/env bash

case $1 in
    bar)
        DATE=$( date +'%a %d %b' )
        TIME=$( date +'%T' )

        echo "$DATE <b>$TIME</b> "
        ;;
    full)
        CAL=$( cal -m -n 2 )

        echo -e "${CAL}"
        ;;
    *)
        continue
        ;;
esac
