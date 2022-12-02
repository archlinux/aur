# Maintainer:  JustKidding <jk@vin.ovh>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.18
pkgrel=1
pkgdesc="Handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN"
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('bcc763d9c49ae23da5d2b7a686d5fd1deec9d9051341160a10d1ac723a26bec0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

