# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=('python-picos')
pkgname=('python-picos' 'python2-picos')
pkgver=1.1.2
pkgrel=2
pkgdesc='A Python Interface for Conic Optimization Solvers.'
arch=('any')
url='http://picos.zib.de'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://picos.zib.de/dist/PICOS-${pkgver}.tar.gz")

package_python-picos() {
	depends=('python-six' 'python-numpy' 'python-cvxopt')

	cd "${srcdir}/PICOS-${pkgver}"

	python setup.py install --root=${pkgdir}
}

package_python2-picos() {
	depends=('python2-six' 'python2-numpy' 'python2-cvxopt')

	cd "${srcdir}/PICOS-${pkgver}"

	python2 setup.py install --root=${pkgdir}
}

md5sums=('e5f7996a70b9ee5bbc5f28347c52a2df')
