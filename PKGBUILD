# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=1.0
pkgrel=1
pkgdesc='A pass extension that helps you to keep the whole tree of password encrypted inside a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass'
         'tomb')
source=(https://github.com/roddhjav/pass-tomb/archive/v${pkgver}.tar.gz)
sha512sums=('37366f59c213181a27b8644807e4252aa7f63a542b94deab0262c8e0652a400fcc4def7a15aa0ab60faf4bda465c1e82d1ae9d4d4d22391680f0e87fc6c71653')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
