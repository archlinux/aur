# Maintainer:  JustKidding <jk@vin.ovh>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.19
pkgrel=1
pkgdesc="Handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN"
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('133ec82f56390ea74c190569e98f2fb14b869808b1d54785708f22d0fead8b3f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

