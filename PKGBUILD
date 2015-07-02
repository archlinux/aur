# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-oslosphinx-liberty")
pkgver=3.0.0
pkgrel=1
pkgdesc="OpenStack Sphinx Extensions and Theme"
arch=(any)
url="https://pypi.python.org/pypi/oslosphinx"
license=('Apache')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/o/oslosphinx/oslosphinx-$pkgver.tar.gz")
md5sums=('0f40f4ac1d2f6ae6230ec7d17dc2ec77')

build() {
  cd "${srcdir}/oslosphinx-${pkgver}/"
  python2 setup.py build
}

package() {
  depends=('python2')

  cd "${srcdir}/oslosphinx-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

