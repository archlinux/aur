# Maintainer: Furkan Kardame <f.kardame@manjaro.org>

pkgname=cockpit-docker
pkgver=82
pkgrel=1
pkgdesc='Cockpit UI for docker containers'
arch=('any')
url='https://github.com/chabad360/cockpit-docker'
license=(LGPL)
depends=(cockpit docker)
source=("${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('45f265d3d81eea39bec2c0aa68bafcf3c7af764b140993a21be8188285a48f24')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install PREFIX=/usr
}