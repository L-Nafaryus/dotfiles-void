#!/usr/bin/env bash

ADAPTER=$( acpi -a | awk -F' ' '{print $3}' )
BATTERY=$( acpi -b | awk -F' ' '{print $4}' | sed 's/,//g' )
STATUS=$( acpi -b | awk -F' ' '{print $3}' | sed 's/,//g' )
TIME=$( acpi -b | awk -F' ' '{print $5}' )

case $1 in
    bar)
        if [ ${ADAPTER} == "on-line" ]; then
            echo "${BATTERY} (+)"
        else
            echo "${BATTERY} (-)"
        fi
        ;;
    full)
        echo -e "Battery: ${BATTERY}\nAdapter: ${ADAPTER}\nStatus: ${STATUS}\nRemaining: ${TIME}"
        ;;
    *)
        continue
        ;;
esac
