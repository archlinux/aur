# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.17
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('374e2b5e13912ccdbf50b0b23fca2c3e0531174805c32d74e145f37756328340')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

