#!/bin/bash

sed -i -e 's|include "/root/scripts/net-blocking-tools/known-wordpress-attackers/NFTables.rules"||g' /etc/nftables.conf

