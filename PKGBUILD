# Maintainer: Furkan Kardame <f.kardame@manjaro.org>

pkgname=cockpit-docker
pkgver=15
pkgrel=1
pkgdesc='Cockpit UI for docker containers'
arch=('any')
url='https://github.com/chabad360/cockpit-docker'
license=(LGPL)
depends=(cockpit docker)
source=("${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('119d2628a02e606e69cccf3ec928fd4228c1a97d0794f851328e88f9157561ae')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install PREFIX=/usr
}
