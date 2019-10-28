# net-blocking-tools

Tools to block some internet traffic

## Installation

```shell
apt-get -y update
apt-get -y install git ipset
rm /root/scripts/net-blocking-tools -R
cd /root/scripts
git clone --depth=1 https://github.com/nipegun/net-blocking-tools
rm /root/scripts/net-blocking-tools/.git -R
rm /root/scripts/net-blocking-tools/README.md
find /root/scripts/net-blocking-tools/ -type f -iname "*.sh" -exec chmod +x {} \;
```
## Tools

### non-spanish-speaking countries

Puedes aprender sobre la distribución geográfica del idioma español aquí:

https://es.wikipedia.org/wiki/Distribuci%C3%B3n_geogr%C3%A1fica_del_idioma_espa%C3%B1ol
