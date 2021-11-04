#!/usr/bin/env bash

# Sinks
HDMI=$( pactl list sinks short | grep hdmi | awk '{ print $1 }' )
IEC958=$( pactl list sinks short | grep iec958 | awk '{ print $1 }' )
ANALOG=$( pactl list sinks short | grep analog | awk '{ print $1 }' )

SINK=${IEC958}

VOLUME=$( pamixer --sink ${SINK} --get-volume-human )

if [ ${VOLUME} == "muted" ]; then
    echo "M"
else
    echo ${VOLUME}
fi
