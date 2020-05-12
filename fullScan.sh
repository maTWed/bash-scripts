#!/bin/bash
# Full TCP scan script
# by:maTWed

RED="\e[1;31m"
GREEN="\e[1;32m"
NOCOLOR="\e[0m"

# Check for IP argument
if [ -z "$1" ]; then
	echo -e "\n"
	echo -e "${RED}[!] Usage: ${GREEN}$0 <IP Address>${NOCOLOR}"
	echo -e "\n"
	exit 1
fi

echo -e "\n"
echo -e "${RED}[*] Scanning all TCP ports on Target ${GREEN}$1${NOCOLOR}"
echo -e "\n"

nmap -sS -p- --open $1 | awk '/open port/ {print $4}' | cut -d'/' -f1 >> $1.txt && cat $1.txt | paste -s -d, - >> $1.ports.txt && nmap -sC -sV -vvv --reason -p `cat $1.ports.txt` -oA $1 $1

echo -e "\n"
echo -e "${RED}[*] Scan Complete of Target ${GREEN}$1 ${RED}!${NOCOLOR}"
echo -e "\n"

rm allPorts* && rm openPorts && rm scanPorts

echo -e "\n"
echo -e "${GREEN}[*] Clean up Complete!${NOCOLOR}"
echo -e "\n"
