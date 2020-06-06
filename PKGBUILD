# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-untwisted
pkgver=2.0.1
pkgrel=1
pkgdesc='A library for asynchronous programming in python'
arch=('any')
url="https://github.com/untwisted/untwisted"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/untwisted/untwisted/archive/v${pkgver}.tar.gz")
sha256sums=('e5c35613f78b97ecadfac8eda37ce6836ead9f5652096e71048cc1158c23683d')

package() {
  cd "untwisted-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}