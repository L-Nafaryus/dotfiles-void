#!/usr/bin/env bash
#curl 'https://wttr.in/Tyumen?0&Q&T&lang=en' | cut -c 16- | head -2 | xargs echo

WEATHER=

case $1 in
    bar)
        WEATHER=$( curl 'https://wttr.in/Tyumen?T&format=2' | sed 's/ /\n/g' | cut -c 8- | xargs )
        ;;
    full)
        WEATHER=$( curl 'https://wttr.in/Tyumen?0&Q&T&lang=en' )
        ;;
    *)
        continue
        ;;
esac

echo "${WEATHER}"
