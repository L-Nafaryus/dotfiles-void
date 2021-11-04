#!/usr/bin/env bash
BRIGHTNESS=$( printf "%.0f " $(light -G) | sed 's/ //g' )

echo "${BRIGHTNESS}%"
