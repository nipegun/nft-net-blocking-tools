#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

echo ""
echo -e "${ColorVerde}Creating GeoIP HAProxy sets....${FinColor}"
echo ""

#IPv4
mkdir -p /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4
      cp /root/scripts/nft-net-blocking-tools/geoipsets/ipset/ipv4/* /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4
    find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.ipv4" -exec bash -c 'mv "$1" "${1%.ipv4}".haproxy' - '{}' \;
    find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.haproxy" -exec sed -i '1d' {} \;
    find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.haproxy" -exec sed -i 's/^............//' {} \;
    find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.haproxy" -exec sed -i 's/...........$//' {} \;
    find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.haproxy" -exec sed -i 's| comment | |g' {} \;

# IPv6
mkdir -p /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6
cp /root/scripts/nft-net-blocking-tools/geoipsets/ipset/ipv6/* /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6
find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.ipv6" -exec bash -c 'mv "$1" "${1%.ipv6}".haproxy' - '{}' \;
find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.haproxy" -exec sed -i '1d' {} \;
find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.haproxy" -exec sed -i 's/^............//' {} \;
find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.haproxy" -exec sed -i 's/...........$//' {} \;
find /root/scripts/nft-net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.haproxy" -exec sed -i 's| comment | |g' {} \;

