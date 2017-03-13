# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-sdds
pkgver=0.13
pkgrel=1
pkgdesc="Pure python parser for the sdds file format"
arch=('any')
url="https://github.com/greyltc/python-sdds/"
license=('MIT')
depends=('python-numpy')
source=("https://github.com/greyltc/python-sdds/archive/v${pkgver}.tar.gz")
md5sums=('6f36221d2899a8648a5ec380bb14f60f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
