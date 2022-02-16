#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
ColorEnd='\033[0m'

echo ""
echo -e "${ColorGreen}Blocking known rdp attackers...${ColorEnd}"
echo ""

# Install NFTables, in case is not installed
apt-get -y install nftables > /dev/null

# Move the IPv4 IPs list to a NFTables rules file
while read IP
  do
    sed -i '/^define KnownRDPAttackers.ipv4 = {/a '"$IP"',' /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv4.nftables
  done < /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv4.list

# Move the IPv6 IPs list to a NFTables rules file
while read IP
  do
    sed -i '/^define KnownRDPAttackers.ipv6 = {/a '"$IP"',' /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv6.nftables
  done < /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv6.list

# Correct unknown error
sed -i -e 's|istrwp||g' /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv4.nftables
sed -i -e 's|istrwp||g' /root/scripts/nft-net-blocking-tools/known-rdp-attackers/IPv6.nftables

# Delete previous blocks, if exists
/root/scripts/nft-net-blocking-tools/known-rdp-attackers/NFTables-Unblock.sh

# BackUp NFTables original configuration file
cp /etc/nftables.conf /etc/nftables.conf.bak

# Include the rules in the NFTables configuration file
sed -i '/^flush ruleset/a include "/root/scripts/nft-net-blocking-tools/known-rdp-attackers/NFTables.rules"' /etc/nftables.conf
sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

# Reload NFTables rules
nft --file /etc/nftables.conf

