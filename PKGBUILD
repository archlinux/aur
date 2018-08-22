# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-pyleri
pkgver=1.2.2
pkgrel=1
pkgdesc='Left-right parse'
arch=(any)
url=https://github.com/transceptor-technology/pyleri
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('b0dcbd82b2a920336b2a6ab9f420f0599ebe49fcc53f8a50e206a83f458462dc950231beb91ef01329067715554a5efd44861bd99aa4e8dd5099e5c6aa60ec8e')

package() {
  cd pyleri-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/python-pyleri/LICENSE
}
