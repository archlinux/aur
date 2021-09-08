# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-googletrans
pkgver=3.1.0a0
pkgrel=2
pkgdesc="Free Google Translate API for Python."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=('python-setuptools' 'python-httpx=0.13.3')
source=("https://pypi.io/packages/source/g/googletrans/googletrans-$pkgver.tar.gz")
sha512sums=('0640f8e301f205fbf415dc1ea310d342dbd9e06dc3e87029f2928bcd945b4c0f41e70b829f5f8eeb1125d5fccffe1f210ba963b461e6c22b6ea7e79ccfb6996f')

build() {
  cd googletrans-$pkgver
  python setup.py build
}

package() {
  cd googletrans-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

