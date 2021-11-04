#!/usr/bin/env bash

# Sinks
HDMI=$( pactl list sinks short | grep hdmi | awk '{ print $1 }' )
IEC958=$( pactl list sinks short | grep iec958 | awk '{ print $1 }' )
ANALOG=$( pactl list sinks short | grep analog | awk '{ print $1 }' )

SINK=${IEC958}

case $1 in
    inc) 
        pamixer --sink ${SINK} --increase $2 
        ;;
    dec)
        pamixer --sink ${SINK} --decrease $2
        ;;
    mute)
        pamixer --sink ${SINK} --toggle-mute
        ;;
esac
