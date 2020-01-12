# Contributor: masutu < masutu dot arch dot googlemail dot com >
# Maintainer: masutu < masutu dot arch dot googlemail dot com >
pkgname=qloud
pkgver=1.2
pkgrel=2
pkgdesc="A tool to measure a loudspeaker frequency response and distortions."
arch=('i686' 'x86_64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qwt')
source=(git+https://github.com/molke-productions/qloud.git)
sha512sums=('SKIP')


build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bin/qloud $pkgdir/usr/bin/qloud
}

# vim:set ts=2 sw=2 et:
