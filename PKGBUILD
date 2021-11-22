# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-googletrans
pkgver=4.0.0rc1
pkgrel=1
pkgdesc="Free Google Translate API for Python."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=('python-httpx=0.13.3')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/g/googletrans/googletrans-$pkgver.tar.gz")
sha512sums=('fcb0330c51680fa91fdea994cf5ec6d19867c0996183529df5d1d0c63ef4d1fd4e9a2a061d6c01a9a0c302faf640724f3bdaff335ad663874af9588bd3210eaa')

build() {
  cd googletrans-$pkgver
  python setup.py build
}

package() {
  cd googletrans-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

