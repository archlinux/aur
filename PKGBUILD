# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-oslosphinx-kilo")
pkgver=2.5.0
pkgrel=1
pkgdesc="OpenStack Sphinx Extensions and Theme"
arch=(any)
url="https://pypi.python.org/pypi/oslosphinx"
license=('Apache')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/o/oslosphinx/oslosphinx-$pkgver.tar.gz")
md5sums=('2548a1da0c24853c4758eb314530d830')

build() {
  cd "${srcdir}/oslosphinx-${pkgver}/"
  python2 setup.py build
}

package() {
  depends=('python2')

  cd "${srcdir}/oslosphinx-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

