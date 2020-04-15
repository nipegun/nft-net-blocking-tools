#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
EndColor='\033[0m'

echo ""
echo -e "${ColorGreen}Getting TOR Nodes....${EndColor}"
echo ""
# Obtain WAN IP of the computer
WANIP=$(curl --silent ipinfo.io/ip)
# Create the NFTables sets
wget -q https://check.torproject.org/cgi-bin/TorBulkExitList.py?ip=$WANIP -O -|sed '/^#/d' |while read IP
  do
    sed -i '/^define TORNodes.ipv4 = {/a '"$IP"',' /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv4.nftables
    sed -i '/^define TORNodes.ipv6 = {/a '"$IP"',' /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv6.nftables
  done

echo ""
echo -e "${ColorGreen}Creating TOR HAProxy sets....${EndColor}"
echo ""
cp   /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv4.nftables /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv4.haproxy
cp   /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv6.nftables /root/scripts/nft-net-blocking-tools/tor/TORNodesIPv6.haproxy
find /root/scripts/nft-net-blocking-tools/tor/ -name "*.haproxy" -exec sed -i '1d' {} \;
find /root/scripts/nft-net-blocking-tools/tor/ -name "*.haproxy" -exec sed -i 's/.$//' {} \;

