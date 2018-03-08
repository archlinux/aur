# Maintainer: portaloffreedom

_pkgsrcname=pyjokes
pkgname=python-pyjokes
pkgver=0.5.0
pkgrel=1
pkgdesc="One line jokes for programmers (jokes as a service)"
url="https://github.com/pyjokes/pyjokes"
license=("Public Domain")
arch=("any")
depends=('python')
source=("https://pypi.python.org/packages/b4/62/79a5aa98d2db64eb4925e7ae7b9de1fa9f2e78050b5410a69371ba13a86f/$_pkgsrcname-$pkgver.tar.gz")
md5sums=('a357877ddbdffb73d88eea3963ac4f3b')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


