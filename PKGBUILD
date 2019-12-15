# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase='python-smcp'
pkgname=('python-smcp' 'python2-smcp')
pkgdesc="A Python solver for sparse matrix cone programs."
pkgver=0.4.6
pkgrel=3
arch=('any')
url='http://smcp.readthedocs.io'
license=('gpl3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/cvxopt/smcp/archive/v${pkgver}.tar.gz")

package_python-smcp() {
	depends=('python-cvxopt' 'python-chompack')

	cd "${srcdir}/smcp-${pkgver}"

	# Install the Python library.
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-smcp() {
	depends=('python2-cvxopt' 'python-chompack')

	cd "${srcdir}/smcp-${pkgver}"

	# Install the Python 2 library.
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('0ebf84f5080f7e4dd80b9b9149314a71')
