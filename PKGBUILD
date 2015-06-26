# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=gfsm
pkgver=0.0.15.1
_pkgver=0.0.15-1
pkgrel=1
pkgdesc="A weighted finite state transducer (WFST) library and associated command line tools."
arch=(i686 x86_64)
url="http://kaskade.dwds.de/~moocow/mirror/projects/gfsm/"
license=('LGPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://kaskade.dwds.de/~moocow/mirror/projects/gfsm/${pkgname}-${_pkgver}.tar.gz)
md5sums=('e13ca735ee146d242b33d4de74fb6157')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
