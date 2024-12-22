# Contributor: portaloffreedom

pkgname=python-aiml
pkgver=0.9.3
pkgrel=3
pkgdesc="An interpreter module for AIML (Artificial Intelligence Markup Language), implemented in pure Python (python3 fork)"
url="https://github.com/paulovn/python-aiml"
license=("BSD-2-Clause" 'LGPL')
arch=("any")
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/paulovn/${pkgname}/archive/$pkgver.tar.gz")
sha256sums=('00f418cea5384319c177184cf2c7cf9364fe817dd35b409cf1f542d9d46c6d2b')

build() {
  cd $srcdir/${pkgname}-$pkgver
  python3 setup.py build
}

#check() {
#  cd $srcdir/${pkgname}-$pkgver
#  python3 setup.py test
#}

package() {
  cd $srcdir/${pkgname}-$pkgver
  python3 setup.py install --root $pkgdir
}


