# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.13
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('120f83d33fb8b8be1b282f20dd755a892d5facf84f54fa21f75bbd2633128160')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}