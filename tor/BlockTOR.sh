#!/bin/bash

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
ColorEnd='\033[0m'

echo ""
echo -e "${ColorGreen}Blocking TOR nodes...${ColorEnd}"
echo ""

# Install NFTables, in case is not installed
apt-get -y install nftables > /dev/null

# Obtain WAN IP of the computer
WANIP=$(curl --silent ipinfo.io/ip)

# Create the NFT sets
wget -q https://check.torproject.org/cgi-bin/TorBulkExitList.py?ip=$WANIP -O -|sed '/^#/d' |while read IP
  do
  sed -i '/^define TORNodes.ipv4 = {/a '"$IP"',' /root/scripts/net-blocking-tools/tor/IPv4.nftables
  sed -i '/^define TORNodes.ipv6 = {/a '"$IP"',' /root/scripts/net-blocking-tools/tor/IPv6.nftables
  done

# Delete previous blocks, if exists
/root/scripts/net-blocking-tools/tor/UnblockTOR.sh

# BackUp NFTables original configuration file
cp /etc/nftables.conf /etc/nftables.conf.bak

# Include the rules in the NFTables configuration file
sed -i '/^flush ruleset/a include "/root/scripts/net-blocking-tools/tor/IPv4.nftables"' /etc/nftables.conf
sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

# Reload NFTables rules
nft --file /etc/nftables.conf

