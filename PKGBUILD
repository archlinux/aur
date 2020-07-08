# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos-git
pkgver=2.0.r8.g7c304b3
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers. Git version.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
depends=('python-numpy' 'python-cvxopt')
makedepends=('git' 'python-setuptools')
conflicts=('python-picos')
source=("picos::git+https://gitlab.com/picos-api/picos.git")

pkgver() {
	cd picos
	./version.py --aur
}

package() {
	cd picos
	python setup.py install --root=${pkgdir}
}

md5sums=('SKIP')
