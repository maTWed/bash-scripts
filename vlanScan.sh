#!/bin/bash
# map vlans
# by:maTWed

RED="\e[1;31m"
GREEN="\e[1;32m"
NOCOLOR="\e[0m"

echo -e "\n"
read -p "Enter ip range. ex: 10.101.10.1-254: " iprange
read -p "Enter name to save the file: " file

mkdir -p /root/ips/
touch /root/ips/$file-hosts
nmap -sn -v --open $iprange | awk '/scan report/ {print $5,$6}' >> /root/ips/$file-hosts
touch /root/ips/$file-ips
cat /root/ips/$file-hosts | cut -d'(' -f 2 | cut -d')' -f 1 >> /root/ips/$file-ips

echo -e "\n"
echo -e "${RED}Created file with only ips in file ${GREEN}$file-ips${RED} and host names with ips in file ${GREEN}$file-hosts${NOCOLOR}"
echo -e "\n"

echo -e "${RED}###########################${NOCOLOR}"
echo -e "${RED}IPs for ${GREEN}$iprange${NOCOLOR}"
echo -e "${RED}###########################${NOCOLOR}"

cat /root/ips/$file-ips

echo -e "\n"
echo -e "${RED}###############################${NOCOLOR}"
echo -e "${RED}Hostnames with IPs for ${GREEN}$iprange${NOCOLOR}"
echo -e "${RED}###############################${NOCOLOR}"
cat /root/ips/$file-hosts
echo -e "\n"
