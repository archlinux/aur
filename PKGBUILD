# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=muscle
pkgver=5.0.1428
pkgrel=1
pkgdesc="Multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="https://github.com/rcedgar/muscle"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('59a8196890893e44a60f24134e8da24ee8381830a0f84e37378a3ca8be5430f5')

#build() {
#  cd "$srcdir"/$pkgname-$pkgver
#  make
##  if [ "${CARCH}" = "i686" ]; then
##    make CFLAGS=" -march=i686 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
##  else
##    make CFLAGS=" -march=x86-64 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
##  fi
#}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 binaries/muscle "$pkgdir"/usr/bin/muscle
}
