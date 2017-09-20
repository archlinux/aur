# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=divfix++
pkgver=0.34
pkgrel=1
pkgdesc="A DivX avi video repair tool"
arch=('i686' 'x86_64')
url="http://www.divfix.org/"
license=('GPL')
depends=('wxgtk')
source=("https://downloads.sourceforge.net/divfixpp/DivFix++_v$pkgver-src.tar.bz2")
sha256sums=('3123be9f8ed644bdda865365781c73c98e11c4a1984abd8fc6e46defad4fde21')

build() {
  cd DivFix++_v$pkgver
  make
}

package() {
  cd DivFix++_v$pkgver
  make DESTDIR="$pkgdir" install
}
