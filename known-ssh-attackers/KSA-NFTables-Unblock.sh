#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

sed -i -e 's|include "/root/scripts/nft-net-blocking-tools/known-ssh-attackers/NFTables.rules"||g' /etc/nftables.conf

# Reload NFTables rules
  nft --file /etc/nftables.conf

