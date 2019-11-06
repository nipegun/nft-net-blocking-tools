#!/bin/bash

#IPv4
mkdir -p /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4
cp /root/scripts/net-blocking-tools/geoipsets/ipset/ipv4/* /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.ipv4" -exec bash -c 'mv "$1" "${1%.ipv4}".subnet' - '{}' \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.subnet" -exec sed -i '1d' {} \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.subnet" -exec sed -i 's/^............//' {} \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv4/ -name "*.subnet" -exec sed -i 's| comment | |g' {} \;

# IPv6
mkdir -p /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6
cp /root/scripts/net-blocking-tools/geoipsets/ipset/ipv6/* /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.ipv6" -exec bash -c 'mv "$1" "${1%.ipv6}".subnet' - '{}' \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.subnet" -exec sed -i '1d' {} \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.subnet" -exec sed -i 's/^............//' {} \;
find /root/scripts/net-blocking-tools/geoipsets/haproxyset/ipv6/ -name "*.subnet" -exec sed -i 's| comment | |g' {} \;

