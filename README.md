# bash-scripts
- netNinja was a project I started working on before I decided to devote all my time to OSCP. It need some more customization but it is very functional. I have even used it in the labs.

- vpn.sh --> This will allow you to quickly choose which vpn server to use. If you are not using nordvpn small changes will need to be made.

- resolv.sh --> This changes your default /etc/resolv.conf file to only use nameservers of your vpn. Put the file "nameservers" and "resolv" in the same file as this script or change the location inside the script.

- killSwitch.sh --> This is ran after vpn.sh and resolv.sh. This will set firewall rules to kill all traffic not routed though the vpn. I used ufw to keep things more simple. If the VPN ever drops all connections will also be terminated. Therefore ensuring your browsing/torrenting remains unknown to your ISP.
