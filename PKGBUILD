# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=cronic
pkgver=3
pkgrel=1
pkgdesc="Cronic is a shell script to help control the most annoying feature of cron: unwanted emailed output."
url="http://habilis.net/cronic/"
depends=('bash')
license=('CC0')
arch=('any')
binaryname="cronic-v${pkgver}"
source=(http://habilis.net/cronic/${binaryname})
sha256sums=('25d9772e142ebdcaa72433431e26d855ae82b085709faf0d2169b3bda867aeac')

package() {
    cd "$srcdir"

    install -m 0755 -d $pkgdir/usr/bin/
    install -m 0755 "${binaryname}" $pkgdir/usr/bin/cronic
}


