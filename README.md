# net-blocking-tools

Tools to block some internet traffic

## Instalation

```shell
apt-get -y update
apt-get -y install git ipset
rm /root/scripts/net-blocking-tools -R
cd /root/scripts
git clone --depth=1 https://github.com/nipegun/net-blocking-tools
rm /root/scripts/net-blocking-tools/.git -R
rm /root/scripts/net-blocking-tools/README.md
chmod +x /root/scripts/net-blocking-tools/*.sh -R
```

