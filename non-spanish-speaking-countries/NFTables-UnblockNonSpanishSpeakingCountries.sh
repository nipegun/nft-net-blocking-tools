#!/bin/bash

sed -i -e 's|include "/root/scripts/net-blocking-tools/non-spanish-speaking-countries/NFTables.rules"||g' /etc/nftables.conf
