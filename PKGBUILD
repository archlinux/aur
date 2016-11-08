# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=besttrace
pkgver=1.1.0
pkgrel=1
pkgdesc="IPIP.net 开发的加强版 traceroute，附带链路可视化"
arch=('x86_64' 'i686')
url="https://www.ipip.net/download.html#ip_trace"
license=('custom')

if [ "${CARCH}" = "i686" ]; then
    _filename=besttrace32
else
    _filename=besttrace
fi

source=("https://cdn.ipip.net/17mon/besttrace4linux.zip")
md5sums=("b29209f9b04979aa3587cbc33e0ad03b")

package(){
    mkdir -p "$pkgdir"/usr/bin/

    install -m4755 "$srcdir"/$_filename "$pkgdir"/usr/bin/besttrace
}
