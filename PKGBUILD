# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-overrides
pkgver=3.1.0
pkgrel=1
pkgdesc='A decorator to automatically detect mismatch when overriding a method'
arch=('any')
url='https://github.com/mkorpela/overrides'
license=('Apache')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mkorpela/overrides/archive/${pkgver}.tar.gz")
sha256sums=('af85c1b1c5a46342862442e5f02f7269ecf957d05f043151f861c8f43ffcec15')

package() {
  cd "overrides-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}