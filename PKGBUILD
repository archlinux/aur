# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos
pkgver=2.0
pkgrel=2
pkgdesc='A Python interface to conic optimization solvers.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
depends=('python-numpy' 'python-cvxopt')
makedepends=('python-setuptools')
conflicts=('python-picos-git')
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/picos-v${pkgver}.tar.gz")

package() {
	cd "${srcdir}/picos-v${pkgver}"
	python setup.py install --root=${pkgdir}
}

md5sums=('3317dc2fd98202a413acae19efdc844e')
