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
sha256sums=('61cffe0950db5d76c75ee9d39d94cdbdac4d7eef675b55b4a0cc30e380ecbfec')

package() {
  cd "${srcdir}/questplus-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}