# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=('python-picos')
pkgname=('python-picos' 'python2-picos')
pkgver=1.1.2
pkgrel=4
pkgdesc='A Python Interface for Conic Optimization Solvers.'
arch=('any')
url='http://picos.zib.de'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/picos-v${pkgver}.tar.gz")

package_python-picos() {
	depends=('python-six' 'python-numpy' 'python-cvxopt')

	cd "${srcdir}/picos-v${pkgver}"

	python setup.py install --root=${pkgdir}
}

package_python2-picos() {
	depends=('python2-six' 'python2-numpy' 'python2-cvxopt')

	cd "${srcdir}/picos-v${pkgver}"

	python2 setup.py install --root=${pkgdir}
}

md5sums=('aadf3b0c543b5dfdcfefdf007f11cf39')
