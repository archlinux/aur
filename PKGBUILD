# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-chompack
pkgver=2.3.4
pkgrel=1
pkgdesc='A Python library for chordal matrix computations.'
arch=('any')
url='http://chompack.readthedocs.io'
license=('GPL-3.0-or-later')
depends=('python-cvxopt')
makedepends=('python-setuptools')
source=("https://github.com/cvxopt/chompack/archive/v${pkgver}.tar.gz")
md5sums=('87256ac9433bab4593221fc27049e7af')

package() {
	cd "${srcdir}/chompack-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" \
		python setup.py install --root="${pkgdir}" --optimize=1
}
