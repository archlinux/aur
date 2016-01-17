# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname=awl
pkgver=0.56
pkgrel=2
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php' 'make')
install="$pkgname.install"
source=("git+https://gitlab.com/davical-project/awl.git#tag=r${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/awl"
  cp -a . $pkgdir/usr/share/awl
}

