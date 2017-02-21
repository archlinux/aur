# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=0.1
pkgrel=1
pkgdesc='A pass extension allowing you to put and manage your password repository in a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass-git'
         'tomb-git')
source=(https://github.com/roddhjav/pass-tomb/archive/v${pkgver}.tar.gz)
sha512sums=('0348079227c39bc4a5ee73071b408e4e57ab67be6e118528eede49d514c07efcbdce3033691007ff8aefcaf46c208940f937ac43af930178b52561d74eba835f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
