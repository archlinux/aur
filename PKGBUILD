# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=besttrace
pkgver=1.3.4
pkgrel=2
pkgdesc="IPIP.net 开发的加强版 traceroute，附带链路可视化"
arch=('x86_64' 'i686')
url="https://www.ipip.net/product/client.html#besttrace"
license=('custom')
install=besttrace.install

if [ "${CARCH}" = "i686" ]; then
    _filename=besttrace32
else
    _filename=besttrace
fi

source=("besttrace-$pkgver.zip::https://cdn.ipip.net/17mon/besttrace4linux.zip")
md5sums=('22081037203f657f3686111c9881588b')

package(){
    mkdir -p "$pkgdir"/usr/bin/

    install -m755 "$srcdir"/$_filename "$pkgdir"/usr/bin/besttrace
}
