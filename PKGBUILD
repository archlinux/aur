# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-googletrans
pkgver=2.4.0
pkgrel=1
pkgdesc="Free Google Translate API for Python."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/g/googletrans/googletrans-$pkgver.tar.gz")
sha512sums=('6a6f29542478dc128d5e5ac418fcdf71aa8f600e76bf4101295b36c4758202feed6effdf939555f8e1f9afacf0b4f3016b326a8e3f0bfadda0ed97cc7d480b4b')

build() {
  cd googletrans-$pkgver
  python setup.py build
}

package() {
  cd googletrans-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

