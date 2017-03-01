# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=0.2
pkgrel=1
pkgdesc='A pass extension allowing you to put and manage your password repository in a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass'
         'tomb-git')
source=(https://github.com/roddhjav/pass-tomb/archive/v${pkgver}.tar.gz)
sha512sums=('2d1529796bbf299e414c542744d8a841c4b767f5faab3f6bb619ab322d6e0efa0bbf2da7f2233b3bdadcd54aab2bf03dce7b094254d538cae8dcca59e36006f1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
