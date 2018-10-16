#!/bin/bash
# VPN KillSwitch

echo "engage of disable"
read input
if [ $input == engage ]
then
    sudo ufw reset
    sudo ufw default deny incoming
    sudo ufw default deny outgoing
    sudo ufw allow out on tun0 from any to any
    sudo ufw enable
    echo "KillSwitch Engaged!"
    exit
elif [ $input == disable ]
then
    sudo ufw reset
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
    echo "KillSwitch Disabled!"
    exit
else
    echo "Type 'engage' or 'disable'"
    exit
fi
