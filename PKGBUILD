# Maintainer: Furkan Kardame <f.kardame@manjaro.org>

pkgname=cockpit-docker
pkgver=16
pkgrel=1
pkgdesc='Cockpit UI for docker containers'
arch=('any')
url='https://github.com/chabad360/cockpit-docker'
license=(LGPL)
depends=(cockpit docker)
source=("${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('9a226e7a0b9c8c224114e44fa57df9a8ffb43be817d751e3d992ecd42d221b51')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install PREFIX=/usr
}
