# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python2-quantities
pkgver=0.11.1
pkgrel=2
pkgdesc="Support for physical quantities with units, based on numpy"
url="http://packages.python.org/quantities"
arch=('any')
license=('BSD')
depends=('python2-numpy' 'python2-nose')
source=("https://pypi.python.org/packages/e4/73/23dbd5482d16e6e7bac98e3998c22cbcbecf92dda447bfe1b9ea4ae1509a/quantities-0.11.1.zip")
sha256sums=('4382098a501b55bf0fdb3dba2061a161041253697d78811ecfd7c55449836660')

build() {
  cd "${srcdir}/quantities-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/quantities-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
