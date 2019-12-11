# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase='python-pyscipopt'
pkgname=('python-pyscipopt' 'python2-pyscipopt')
pkgver=2.2.3
pkgrel=1
pkgdesc='A Python Interface to the SCIP Optimization Suite.'
arch=('any')
url='http://scip.zib.de'
license=('MIT')
depends=('scipoptsuite')
makedepends=('cython' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/SCIP-Interfaces/PySCIPOpt/archive/v${pkgver}.tar.gz")

package_python-pyscipopt() {
	depends+=('python')

	cd "${srcdir}/PySCIPOpt-${pkgver}"

	python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pyscipopt() {
	depends+=('python2')

	cd "${srcdir}/PySCIPOpt-${pkgver}"

	python2 setup.py install --root=${pkgdir} --optimize=1
}

md5sums=('d0ba7042aec3c8f246b74034ef42656a')
