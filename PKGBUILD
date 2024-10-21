# Maintainer: x45k <acorns12345678@gmail.com>
pkgname=ckrs
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight script to monitor system resource usage"
arch=('any')
url="https://github.com/x45k/ckrs"
license=('GPL')
depends=('bash' 'nano')
source=("ckrs.sh" "config.conf")
md5sums=('c9a73d768427ca88049c8331fd42fecb' '6d41aea23a9341eebb1eaf7ab63e0e5f')

package() {
    install -Dm755 "$srcdir/ckrs.sh" "$pkgdir/usr/bin/ckrs"
    install -Dm644 "$srcdir/config.conf" "$pkgdir/etc/ckrs/config.conf"
}