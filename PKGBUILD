# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-smcp
pkgver=0.4.6
pkgrel=4
pkgdesc='A Python solver for sparse matrix cone programs.'
arch=('any')
url='http://smcp.readthedocs.io'
license=('GPL3')
depends=('python-cvxopt' 'python-chompack')
makedepends=('python-setuptools')
source=("https://github.com/cvxopt/smcp/archive/v${pkgver}.tar.gz")

package_python-smcp() {
	cd "${srcdir}/smcp-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('0ebf84f5080f7e4dd80b9b9149314a71')
