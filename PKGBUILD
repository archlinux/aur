# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname=awl
pkgver=0.56
pkgrel=1
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php' 'make')
install="$pkgname.install"
source=("${pkgname}.tar.gz::https://gitlab.com/davical-project/awl/repository/archive.tar.gz?ref=r${pkgver}")
sha256sums=('634115c8e5afe46a5160e39415364fe739df16b636764c5dfae40ace9ca13395')

package() {
  cd "$srcdir/$pkgname.git"
  install -d "$pkgdir/usr/share/awl"
  cp -a . $pkgdir/usr/share/awl
}

