#!/usr/bin
# Script taken from The Hacker Playbook 3
# Scan regular ports daily then find changes
# Set this script to run as a cron job
# Set ip range in line 10 to correct range

mkdir /opt/nmap_diff
d=$(date +%Y-%m-%d)
y=$(date -d yesterday +%Y-%m-%d)
/usr/bin/nmap -T4 -oX /opt/nmap_diff/scan_%d.xml 10.10.10.0/24 > /dev/null 2>&1
if [ -e /opt/nmap_diff/scan_$y.xml ]
then
    /usr/bin/ndiff /opt/nmap_diff/scan_$y.xml /opt/nmap_diff/scan_$d.xml > /opt/nmap_diff/diff.txt
fi
