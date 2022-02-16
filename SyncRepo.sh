#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------------------------------------------
#  Script to Sync the nft-net-blocking-tools repo
#
#  Ejecución remota:
#  curl -s https://raw.githubusercontent.com/nipegun/nft-net-blocking-tools/master/SyncRepo.sh | bash
#------------------------------------------------------------------------------------------------------

ColorRed='\033[1;31m'
ColorGreen='\033[1;32m'
EndColor='\033[0m'

# Comprobar si el paquete wget está instalado. Si no lo está, instalarlo.
if [[ $(dpkg-query -s wget 2>/dev/null | grep installed) == "" ]]; then
    echo ""
    echo "wget no está instalado. Iniciando su instalación..."
    echo ""
    apt-get -y update
    apt-get -y install wget
fi

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
    /root/scripts/nft-net-blocking-tools/PostSyncTasks.sh
  else
    echo ""
    echo -e "${ColorRed}The RepoSync coulden´t start because no internet connection was detected.${EndColor}"
    echo ""
fi

