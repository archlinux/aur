# Maintainer: Michael Goehler <somebody dot here at gmx dot de>
pkgname=divfix++
_pkgname=DivFix++
pkgver=0.34
pkgrel=1
pkgdesc="A DivX avi video repair tool."
arch=('i686' 'x86_64')
url="http://www.divfix.org/"
license=('GPL')
depends=('wxgtk')
makedepends=()
optdepends=()
provides=('DivFix++')
options=()
source=(http://downloads.sourceforge.net/project/divfixpp/${_pkgname}/v${pkgver}/${_pkgname}_v${pkgver}-src.tar.bz2)
md5sums=('a3809d7f325b10192c840c7fd5a1156e')

build() {
  cd "$srcdir/${_pkgname}_v${pkgver}"
  make
}

package() {
  cd "$srcdir/${_pkgname}_v${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
