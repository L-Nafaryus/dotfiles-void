#!/usr/bin/env bash

case $1 in
    play)
        mocp -G
        ;;
    next)
        mocp -f
        ;;
    prev)
        mocp -r
        ;;
    status)
        media=$(mocp -Q '%artist - %song') # | cut -c -20)

        if [ "$media" == " - " ]; then
            media="n/a"
        fi

        echo -e "$media"
        ;;
esac
