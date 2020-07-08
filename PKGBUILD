# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-chompack
pkgver=2.3.3
pkgrel=2
pkgdesc='A Python library for chordal matrix computations.'
arch=('any')
url='http://chompack.readthedocs.io'
license=('GPL3')
depends=('python-cvxopt')
makedepends=('python-setuptools')
source=("https://github.com/cvxopt/chompack/archive/v${pkgver}.tar.gz")

package() {
	cd "${srcdir}/chompack-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('ece263e4a907cb45b713458bd18d6dcc')
