# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-sdds
pkgver=0.12
pkgrel=1
pkgdesc="Pure python parser for the sdds file format"
arch=('any')
url="https://github.com/greyltc/python-sdds/"
license=('MIT')
depends=('python-numpy')
source=("https://github.com/greyltc/python-sdds/archive/v0.12.tar.gz")
md5sums=('8b59f4281d89efffd361943661372556')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
