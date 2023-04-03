# Maintainer: Jake Barnes <me+aur@jakebarn.es>
pkgname=vivi
pkgver=3.4.4
pkgrel=1
pkgdesc="Client for Vivi, a wireless screen sharing solution"
arch=('x86_64')
url="http://vivi.io"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'glib2' 'libpulse' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://downloads.vivi.io/app/${pkgver}/${pkgname}.deb")
md5sums=('2aa095182153062e91aff53447acd2d5')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
