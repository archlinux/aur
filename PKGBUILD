# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=nzb
pkgver=0.3
pkgrel=1
pkgdesc="A library and graphical Usenet client for nzb based NNTP downloading and streaming"
arch=('i686' 'x86_64')
url="http://www.nzb.fi/"
license=('GPL')
depends=('openssl' 'qt4')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('29811cfc6bd3d972683b33b7410ddfcbfe829269e12894a7b2ab2392b9b2c050')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt4 DESTDIR="${pkgdir}"/usr/bin
  make
}
