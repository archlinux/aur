# Maintainer: Daniel van der Ploeg <danielvdp56@gmail.com>
pkgname=vivi-preview
pkgver=3.0.0
pkgrel=1
pkgdesc="Beta client for Vivi, a wireless screen sharing solution"
arch=('x86_64')
url="http://vivi.io"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'glib2' 'libpulse' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://downloads.vivi.io/test/app/${pkgver}-beta7/${pkgname}.deb")
md5sums=('c3a7b4fbf881064a7ae67f61a40c5375')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

