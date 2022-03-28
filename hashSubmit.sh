#! /bin/bash
# Submit a hash to VT
# by: maTWed


if [ $# -eq 0 ]; then
    echo "[!] You must put the file path as an argument!"
    echo "[!] ex: ./hashFile.sh /root/Malware/maliciousfile.xls"
else
    malfile=$1

    # hash the file
    hash=`sha256sum $malfile`

    # Send argument to VT
    curl -v --url 'https://www.virustotal.com/vtapi/v2/file/report' -d apikey=ADD_YOUR_API_KEY -d resource=$hash
fi
