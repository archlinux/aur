# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-questplus
pkgver=2019.4
pkgrel=1
pkgdesc='This is a simple implementation of the QUEST+ algorithm in Python'
arch=('any')
url="https://github.com/hoechenberger/questplus"
license=('GPL3')
depends=('python'
				 'python-json-tricks'
				 'python-scipy'
				 'python-xarray')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoechenberger/questplus/archive/${pkgver}.tar.gz")
sha256sums=('9137a51abbbf50d0040e413391c894227e19f4d366dbcbcc30ba51c6cadd75fa')

package() {
  cd "${srcdir}/questplus-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}