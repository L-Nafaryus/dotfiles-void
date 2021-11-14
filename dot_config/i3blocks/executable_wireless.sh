#!/usr/bin/env bash
WIRELESS=$( nmcli -f NAME connection show --active | xargs | cut -d' ' -f2 )

echo $WIRELESS
