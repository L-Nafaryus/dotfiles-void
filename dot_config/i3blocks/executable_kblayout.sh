#!/usr/bin/env bash
MASK=$(xset -q | grep 'LED' | awk '{ print $10 }')

case "${MASK}" in
    # default |caps lock |num lock
    "00000000"|"00000001"|"00000002") LAYOUT="us" ;;
    "00001000"|"00001001"|"00001002") LAYOUT="ru" ;;
    *) LAYOUT="n/a" ;;
esac

echo $LAYOUT
