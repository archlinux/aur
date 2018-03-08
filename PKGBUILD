# Maintainer: portaloffreedom

_pkgsrcname=xmlrunner
pkgname=python-xmlrunner
pkgver=1.7.7
pkgrel=1
pkgdesc="PyUnit-based test runner with JUnit like XML reporting."
url="https://github.com/jaraco/wolframalpha"
license=("MIT")
arch=("any")
depends=('python')
source=("https://pypi.python.org/packages/57/c0/a19e29bc6038a56bb690549573af6ea11a9d2a5c07aff2e27ed308c2cab9/$_pkgsrcname-$pkgver.tar.gz")
md5sums=('7b0b152ed2d278516aedbc0cac22dfb3')

build() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


