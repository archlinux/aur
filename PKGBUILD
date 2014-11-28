# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=mencal
pkgver=2.4
pkgrel=1
pkgdesc="A simple variation of the well-known unix command cal, with periodically repeating days highlighted in color"
arch=('any')
url="http://kyberdigi.cz/projects/mencal"
license=('GPL')
depends=('perl')
source=(http://kyberdigi.cz/projects/$pkgname/files/$pkgname-$pkgver.tar.gz)
sha256sums=('dcb603fcfb36f5bdce69e22ff52ff12b953de08531392d94557c29e5de492c69')

package() {
  cd ${srcdir}/$pkgname-$pkgver

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
