#
# PKGBUILD for librevisa
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=librevisa
pkgver=0.0.20130412
pkgrel=1
epoch=
pkgdesc="Compliant implementation of the VISA standard in a free software library"
arch=('i686', 'x86_64')
url="http://www.librevisa.org"
license=('GPL3')
groups=()
depends=('libusb' 'avahi')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.librevisa.org/download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('3849021d141042ad396e7386de525eb0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# EOF
