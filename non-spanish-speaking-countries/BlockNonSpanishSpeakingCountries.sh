#!/bin/bash

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
ColorEnd='\033[0m'

echo ""
echo -e "${ColorGreen}Blocking non spanish speaking countries...${ColorEnd}"
echo ""

# Install NFTables, in case is not installed
apt-get -y install nftables > /dev/null

# Delete previous blocks, if exists
/root/scripts/net-blocking-tools/non-spanish-speaking-countries/UnblockNonSpanishSpeakingCountries.sh

# BackUp NFTables original configuration file
cp /etc/nftables.conf /etc/nftables.conf.bak

# Include the rules in the NFTables configuration file
sed -i '/^flush ruleset/a include "/root/scripts/net-blocking-tools/non-spanish-speaking-countries/NFTables.rules"' /etc/nftables.conf
sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

# Reload NFTables rules
nft --file /etc/nftables.conf

