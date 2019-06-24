# Maintainer: Dominic Brekau <aur@dominic.brekau.de>
pkgname=python2-pyst
_pkgname=pyst
pkgver=0.6.50
pkgrel=1
pkgdesc="a python interface to asterisk"
arch=('any')
url="http://sourceforge.net/projects/pyst/"
license=('GPL')
depends=('python2')
conflicts=()
options=(!emptydirs)
source=(http://sourceforge.net/projects/pyst/files/pyst/${pkgver}/${_pkgname}-${pkgver}.tar.gz/download)
sha256sums=('84361ca8325704eefd6d54df83b60b8119ee277a968715860b7a81d8015332ea')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

