#!/usr/bin/env bash

lock() {
    $HOME/.config/i3lock/i3lock.sh
}

case "$1" in
    lock)
        i3lock -n -t -i ${HOME}/.config/i3/wallpaper-lock.png
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        suspend
        ;;
    hibernate)
        hibernate
        ;;
    reboot)
        reboot
        ;;
    shutdown)
        poweroff
        ;;
    *)
        echo "Usage: $0 [lock|logout|suspend|hibernate|reboot|shutdown]"
        exit 2
esac

exit 0
