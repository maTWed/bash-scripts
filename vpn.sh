#!/bin/bash
# Run VPN
# by maTWed
# this is for nordvpn small changed will need to be made for others

echo Country? Server? Protocol?
read country server protocol
sudo openvpn /etc/openvpn/ovpn_$protocol/$country$server.nordvpn.com.$protocol.ovpn
