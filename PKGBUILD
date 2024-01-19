# Maintainer: Furkan Kardame <f.kardame@manjaro.org>

pkgname=cockpit-docker
pkgver=14
pkgrel=1
pkgdesc='Cockpit UI for docker containers'
arch=('any')
url='https://github.com/chabad360/cockpit-docker'
license=(LGPL)
depends=(cockpit docker)
source=("${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3fdf5818270223fe95883255867d1d3e3552c1a5cd3d2ab3feab5db55e363e18')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install PREFIX=/usr
}
