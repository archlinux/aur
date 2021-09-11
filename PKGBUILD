# Maintainer: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.7
pkgrel=1
pkgdesc='Simple C++ Serialization & Reflection.'
arch=('any')
url='https://github.com/felixguendling/cista'
license=('MIT')
source=(https://github.com/felixguendling/cista/releases/download/v$pkgver/cista.h)
sha512sums=('83781f6b6c54c86f1c36b9d98c131639b588d1daab4092c823c78723baa0225a5353ca6c3a7628323d7e32aca5344979a995d12ca64686740114e838204b0c56')
package() {
    mkdir -p "$pkgdir/usr/include"
    cp cista.h "$pkgdir/usr/include"
}
