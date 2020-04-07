# Maintainer: Jake Barnes <me+aur@jakebarn.es>
pkgname=vivi
pkgver=2.18.4
pkgrel=1
pkgdesc="Client for Vivi, a wireless screen sharing solution"
arch=('x86_64')
url="http://vivi.io"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'glib2' 'libpulse' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://downloads.vivi.io/app/${pkgver}/${pkgname}.deb")
md5sums=('690f5317835aaea7cb6a7fcbe0a08e0f')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
