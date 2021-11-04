#!/usr/bin/env bash

DRIVE=

case $1 in
    bar)
        DRIVE=$( df -h | grep "/media" | wc -l )
        ;;
    full)
        drives=$( df -h | grep "/media" )
        
        if [ "$drives" == "" ]; then
            DRIVE="Nothing mounted on /media"
        else
            IFS=$'\n'

            for drive in ${drives}; do
                FS=$( echo ${drive} | awk -F' ' '{print $1}' )
                SIZE=$( echo ${drive} | awk -F' ' '{print $2}' )
                USED=$( echo ${drive} | awk -F' ' '{print $3}' )
                MOUNT=$( echo ${drive} | awk -F' ' '{print $6}' )

                DRIVE+="FS: ${FS}\nMount: ${MOUNT}\nUsed: ${USED} / ${SIZE}\n\n"
            done
        fi
        ;;
    *)
        continue
        ;;
esac

echo -e "${DRIVE}"
