# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.14
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('fd3a92b8ec82a159c41dbaa3c5397934d090090c92b04e346412e0fd7e6a1b1c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}