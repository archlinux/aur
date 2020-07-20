# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-googletrans
pkgver=3.0.0
pkgrel=1
pkgdesc="Free Google Translate API for Python."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/g/googletrans/googletrans-$pkgver.tar.gz")
sha512sums=('1a31c52e1fc72ab45131c95ff3649d1d679e3c082adc2b43ba1e5d9bbc57bf740c9e14575c6416e406e6e6e1796cac57330fbb1a639ad96841464e042ef70981')

build() {
  cd googletrans-$pkgver
  python setup.py build
}

package() {
  cd googletrans-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

