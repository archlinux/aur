# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=0.5
pkgrel=1
pkgdesc='A pass extension that provides a convenient solution to update an existing password.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass'
         'tomb-git')
source=(https://github.com/roddhjav/pass-tomb/archive/v${pkgver}.tar.gz)
sha512sums=('bde548496884cfb3f24284a6f9b17e743a42446cd4472e7dbc86eaa9fb62fd94b9362f952b27ad7bd0e3e9a4ca2e38380e32ce35770013dbf6709527dbc9b9f0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
