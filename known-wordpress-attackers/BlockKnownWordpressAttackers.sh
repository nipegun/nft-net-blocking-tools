#!/bin/bash

# Install NFTables, in case is not installed
apt-get -y install nftables

# Move the IPv4 IPs list to a NFTables rules file
while read IP
  do
    sed -i '/^define KnownWordpressAttackers.ipv4 = {/a '"$IP"',' /root/scripts/net-blocking-tools/known-wordpress-attackers/IPv4.nftables
  done < /root/scripts/net-blocking-tools/known-wordpress-attackers/IPv4.list

# Move the IPv6 IPs list to a NFTables rules file
while read IP
  do
    sed -i '/^define KnownWordpressAttackers.ipv6 = {/a '"$IP"',' /root/scripts/net-blocking-tools/known-wordpress-attackers/IPv6.nftables
  done < /root/scripts/net-blocking-tools/known-wordpress-attackers/IPv6.list

# Delete previous blocks, if exists
/root/scripts/net-blocking-tools/known-wordpress-attackers/UnblockKnownWordpressAttackers.sh

# BackUp NFTables original configuration file
cp /etc/nftables.conf /etc/nftables.conf.bak

# Include the rules in the NFTables configuration file
sed -i '/^flush ruleset/a include "/root/scripts/net-blocking-tools/known-wordpress-attackers/NFTables.rules"' /etc/nftables.conf
sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

# Reload NFTables rules
nft --file /etc/nftables.conf

