# Maintainer: canatan <oavc-fujie@yandex.com>

pkgname=quickfm
pkgver=0.3.1
pkgrel=1
pkgdesc="A file manager program which it's UI designed via qtquick"
arch=('i686' 'x86_64')
url="https://github.com/canatan/quickfm"
license=('PUBLIC')
depends=('qt5-quickcontrols')
makedepends=('qt5-quickcontrols')
options=('strip')
source=(https://www.dropbox.com/s/ecj5ybq8m08seo9/quickfm.txz?dl=0)
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
