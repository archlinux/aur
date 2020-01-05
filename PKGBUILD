# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=python-picos
pkgname=('python-picos' 'python2-picos')
pkgver=1.2.0
pkgrel=2
pkgdesc='A Python interface to conic optimization solvers.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/picos-v${pkgver}.tar.gz")

package_python-picos() {
	depends=('python-numpy' 'python-cvxopt')
	conflicts=('python-picos-git')

	cd "${srcdir}/picos-v${pkgver}"

	python setup.py install --root=${pkgdir}
}

package_python2-picos() {
	depends=('python2-numpy' 'python2-cvxopt')
	conflicts=('python2-picos-git')

	cd "${srcdir}/picos-v${pkgver}"

	python2 setup.py install --root=${pkgdir}
}

md5sums=('486dd2f41832d85dc9d2fd6618e32caa')
