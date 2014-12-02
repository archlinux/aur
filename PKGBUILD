# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=mencal
pkgver=3.0
pkgrel=1
pkgdesc="A simple variation of the well-known unix command cal, with periodically repeating days highlighted in color"
arch=('any')
url="http://kyberdigi.cz/projects/mencal"
license=('GPL')
depends=('perl')
source=(http://kyberdigi.cz/projects/$pkgname/files/$pkgname-$pkgver.tar.gz)
sha256sums=('9328d0b2f3f57847e8753c5184531f4832be7123d1b6623afdff892074c03080')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
