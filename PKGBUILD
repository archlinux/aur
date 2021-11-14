# Maintainer: Senthan Sivatharan <senthan dot sivatharan atsign gmail dot com>
pkgname="remlist"
pkgver="0.1"
pkgrel="1"
pkgdesc="A lightweight command-line reminder utility"
arch=('x86_64')
license=('GPL')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz)
sha256sums=('41e9e62cc24d7b08321ac0e35fc819deccbba266779f138ad14ac66190af1dda')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/src/$pkgname-$pkgver.o" "${pkgdir}/usr/bin/remlist"
  chmod +x "${pkgdir}/usr/bin/remlist"
}
