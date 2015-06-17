# Original Author: canatan <oavc-fujie@yandex.com>
# Maintainer     : canatan <oavc-fujie@yandex.com>

pkgname=vakitci
pkgver=0.1
pkgrel=1
pkgdesc="Get,show and notify for prayer times"
arch=('i686' 'x86_64')
url="https://github.com/canatan/projects/tree/master/vakitci"
license=('GPL')
depends=('qt5-webengine')
makedepends=('qt5-webengine')
options=('strip')
source=(https://www.dropbox.com/s/yc2dnv6nlxinkyo/vakitci.txz?dl=0)
md5sums=('SKIP')

build() {
  cd "$pkgname"
  qmake
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
