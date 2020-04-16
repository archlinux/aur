# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.13
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=('any')
url="http://arthurdejong.org/python-stdnum/"
license=('LGPL-2.1')
depends=('python')
makedepends=('python-distribute')
source=("http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
md5sums=('206a28b651bac301fb3aa1004496262e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}