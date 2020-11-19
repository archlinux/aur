# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-untwisted
pkgver=2.0.2
pkgrel=1
pkgdesc='A library for asynchronous programming in python'
arch=('any')
url="https://github.com/untwisted/untwisted"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/untwisted/untwisted/archive/v2.02.tar.gz")
sha256sums=('f58fd29d21b83d586b333bfeec9969385994605ddb9623c419781fa5f9439534')

package() {
  cd "untwisted-2.02"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
