# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-smcp
pkgver=0.5
pkgrel=1
pkgdesc='A Python solver for sparse matrix cone programs.'
arch=('any')
url='https://smcp.readthedocs.io'
license=('GPL-3.0-or-later')
depends=('python-cvxopt' 'python-chompack')
makedepends=('python-setuptools')
source=("https://github.com/cvxopt/smcp/archive/v${pkgver}.tar.gz")
md5sums=('64334f460a4791c4356d5b737f5713fe')

package() {
	cd "${srcdir}/smcp-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" \
		python setup.py install --root="${pkgdir}" --optimize=1
}
