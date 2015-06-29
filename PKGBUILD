# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname=awl
pkgver=0.55
pkgrel=1
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php' 'make')
install="$pkgname.install"
source=("${pkgname}.tar.gz::https://gitlab.com/davical-project/awl/repository/archive.tar.gz?ref=r${pkgver}")
sha256sums=('69d8f51e8aefdfb6b5a0fc3e5e32f8b8d650c489079c8ebac5a6b65f2ad3ec89')

package() {
  cd "$srcdir/$pkgname.git"
  install -d "$pkgdir/usr/share/awl"
  cp -a . $pkgdir/usr/share/awl
}

