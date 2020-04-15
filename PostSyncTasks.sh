#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

echo ""
echo -e "${ColorVerde}Starting post-sync tasks....${FinColor}"
echo ""
cd /root/scripts/nft-net-blocking-tools/
   /root/scripts/nft-net-blocking-tools/geoipsets/CreateIPSets.sh -k fqkr86Z0eBqPoHQe
   /root/scripts/nft-net-blocking-tools/tor/GetNodes.sh
   /root/scripts/nft-net-blocking-tools/DeleteUselessFiles.sh
   # Rename all .ipv4 files to .nftables files
   for x in /root/scripts/nft-net-blocking-tools/geoipsets/nftset/ipv4/*.ipv4; do mv "$x" "${x%.ipv4}-ipv4.nftables"; done
   # Rename all .ipv6 files to .nftables file
   for x in /root/scripts/nft-net-blocking-tools/geoipsets/nftset/ipv6/*.ipv6; do mv "$x" "${x%.ipv6}-ipv6.nftables"; done
echo ""
echo -e "${ColorVerde}DONE!!${FinColor}"
echo ""
