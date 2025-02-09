# Maintainer: Cody P Schafer <dev@codyps.com>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot con >
# Contributor: Alexander Matyukhin <matalex1991@gmail.com>
pkgname=obnc
pkgver=0.17.2
pkgrel=6
pkgdesc="Oberon compiler"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-3.0-or-later')
url="http://miasap.se/obnc/"
source=("http://miasap.se/obnc/downloads/obnc_${pkgver}.tar.gz")
depends=("awk" "gc" "glibc" "sdl" "sh")
options=(!buildflags)
md5sums=('b49487449419f25b5bf97cf5bb2276f6')
sha256sums=('f672663e295df6daba53ac59a0280011732b0e7f95078d7944aa8c328b5f47ec')
sha384sums=('25d8c7ee80d6ceb28249e527f82a91bca5f898bddea31cead0801d98c5266ba6a519dedbb376ab764774f585c3a325dd')
sha512sums=('f0565f4dca1dd8f3bfb3462161fef0f38fa5d966ae7d70527bf9d1e9d3bd23bb70f300c1b429bb02e65c7ff042c3a0c7d7d150f0132304e8bc00b769b5bf0f89')
build() {
  cd $srcdir/$pkgname-$pkgver/
  pwd
  ./build --prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  ./install --destdir=$pkgdir
}

