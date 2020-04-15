#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------
#  Script to Sync the nft-net-blocking-tools repo
#--------------------------------------------------

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
EndColor='\033[0m'

# Check if there is internet connection before syncing the repo
wget -q --tries=10 --timeout=20 --spider https://github.com
  if [[ $? -eq 0 ]]; then
    echo ""
    echo -e "  ${ColorGreen}Syncing nft-net-blocking-tools repo...${EndColor}" 
    echo ""
    rm /root/scripts/nft-net-blocking-tools -R 2> /dev/null
    cd /root/scripts
    git clone --depth=1 https://github.com/nipegun/nft-net-blocking-tools
      rm /root/scripts/nft-net-blocking-tools/.git -R 2> /dev/null
      rm /root/scripts/nft-net-blocking-tools/README.md 2> /dev/null
    find /root/scripts/nft-net-blocking-tools/ -type f -iname "*.sh" -exec chmod +x {} \;
    echo ""
    echo -e "${ColorGreen}Repo synced correctly.${EndColor}"
    echo ""
    echo ""
    echo -e "${ColorGreen}Getting GeoIP NFTables & IPTables sets....${EndColor}"
    echo ""
    cd /root/scripts/nft-net-blocking-tools/
       /root/scripts/nft-net-blocking-tools/geoipsets/CreateIPSets.sh -k fqkr86Z0eBqPoHQe
       /root/scripts/nft-net-blocking-tools/geoipsets/CreateIPSets-HAProxy.sh
       /root/scripts/nft-net-blocking-tools/tor/GetNodes.sh
  else
    echo ""
    echo -e "${ColorRed}The RepoSync coulden´t start because no internet connection was detected.${EndColor}"
    echo ""
fi
