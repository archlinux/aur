# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-pyscipopt
pkgver=3.0.1
pkgrel=1
pkgdesc='A Python Interface to the SCIP Optimization Suite.'
arch=('any')
url='http://scip.zib.de'
license=('MIT')
depends=('python' 'scipoptsuite')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/SCIP-Interfaces/PySCIPOpt/archive/v${pkgver}.tar.gz")

package() {
	cd "${srcdir}/PySCIPOpt-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

md5sums=('413aa9cd8b29f561948632f8c7a4ecc7')
