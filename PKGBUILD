# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=cronic
pkgver=2
pkgrel=2
pkgdesc="Cronic is a shell script to help control the most annoying feature of cron: unwanted emailed output."
url="http://habilis.net/cronic/"
depends=('bash')
license=('CC0')
arch=('any')
source=(http://habilis.net/cronic/cronic)
md5sums=('a488e6c2c76d8d00eb5576a164be4cf3')

package() {
    cd "$srcdir"

    install -m 0755 -d $pkgdir/usr/bin/
    install -m 0755 cronic $pkgdir/usr/bin/cronic
}


