# Maintainer: dacoit <dacoit at tuta.io>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof
pkgver=20120531
pkgrel=1
pkgdesc='An ad-hoc single file webserver; Web Offer One File'
arch=('any')
url='http://www.home.unix-ag.org/simon/woof.html'
license=('GPL2')
depends=('python2')
conflicts=('woof-python3')
source=("http://www.home.unix-ag.org/simon/$pkgname")
md5sums=('89081e64362421dcb683a19c10a15e59')

prepare() {
    sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' "$pkgname"
}

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
