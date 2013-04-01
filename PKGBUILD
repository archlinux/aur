# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=wait4
pkgver=0.3.1
pkgrel=1
pkgdesc="Wait for an arbitrary process"
arch=('i686' 'x86_64')
url="http://www.incenp.org/gitweb/?p=wait4.git;a=summary"
license=('GPL3')
depends=()
makedepends=()
checkdepends=()
source=("http://www.incenp.org/files/softs/wait4/0.3/wait4-${pkgver}.tar.gz")
sha256sums=('976b54fd3ae310a81fd383eed473a0a0a538e25072c4cf9a02d87114c22ea80e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
