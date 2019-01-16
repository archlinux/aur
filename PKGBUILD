# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Moritz Kaspar Rudert (mortzu)

pkgname=libcrystalhd
pkgver=20131127
pkgrel=2
pkgdesc="Broadcom Crystal HD library"
arch=('i686' 'x86_64')
url="https://github.com/agx/libcrystalhd"
license=('LGPLv2.1')
source=("$pkgname-$pkgver.zip::https://github.com/agx/libcrystalhd/archive/master.zip")
sha256sums=('a52154ae3278c5418032a6882f20103747514be25d1abab78c357725d48949e4')

build() {
  cd "$pkgname-master"
  ./autogen.sh
  make
}

package() {
  cd "$pkgname-master"
  make DESTDIR="$pkgdir" install
}
# vim:syntax=sh
