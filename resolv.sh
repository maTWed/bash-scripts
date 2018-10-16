#!/bin/bash
# Simple resolv.conf change script
# by maTWed
# The files; nameservers and resolv need to exits
# cp /etc/resolv.conf ~/resolv  # System default resolv.conf
# add your vpn's nameserver to file named nameservers
#   echo nameserver [IP] > nameservers

echo "change or restore"
read input
if [ $input == change ]
then
    sudo rm /etc/resolv.conf
    sudo cp nameservers /etc/resolv.conf
    echo resolv.conf changed!
    cat /etc/resolv.conf
    exit
elif [ $input == restore ]
then
    sudo rm /etc/resolv.conf
    sudo cp resolv /etc/resolv.conf
    echo resolv.conf restored!
    cat /etc/resolv.conf
    exit
else
    echo Please enter 'change' or 'restore'
    exit
fi
