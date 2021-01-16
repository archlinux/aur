# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-untwisted
pkgver=3.2.2
pkgrel=1
pkgdesc='A library for asynchronous programming in python'
arch=('any')
url="https://github.com/untwisted/untwisted"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/untwisted/untwisted/archive/v${pkgver}.tar.gz")
sha256sums=('ddee7f9d6c732eb210f3aeea4896ff34f795326a5b3401adb3814748d995f188')

package() {
  cd "untwisted-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
