#!/usr/bin/env bash
WIRELESS=$( nmcli -f NAME connection show --active | tail -n -1 )

echo $WIRELESS
