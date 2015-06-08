# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python2-quantities
pkgver=0.10.1
pkgrel=2
pkgdesc="Support for physical quantities based on the popular numpy library"
url="http://packages.python.org/quantities"
arch=('any')
license=('BSD')
depends=('python2-numpy' 'python2-nose')
source=(http://pypi.python.org/packages/source/q/quantities/quantities-${pkgver}.tar.gz)
sha256sums=('2d27caf31a5e0c37130ac0c14bfa8f9412a5ff1fbf3378a1d6085594776c4315')

build() {
  cd "${srcdir}/quantities-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/quantities-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
