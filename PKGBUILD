# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgbase=python-cmdln
pkgname=(python-cmdln python2-cmdln)
pkgver=2.0.0
pkgrel=1
pkgdesc='a Python module for easily building good multi-command scripts'
arch=('i686' 'x86_64')
url='http://github.com/trentm/cmdln'
license=('MIT')
depends=('python')
makedepends=('python2')
provides=('cmdln')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trentm/cmdln/archive/${pkgver}.tar.gz")
sha256sums=('5545a51770d494b9297dce4e2ad2d06efbd133d29184e97393710dec954cb6e4')

package_python-cmdln() {
	depends=('python')

	cd cmdln-${pkgver}/

	python setup.py build

	python setup.py install --prefix="${pkgdir}"/usr
}

package_python2-cmdln() {
	depends=('python2')

	cd cmdln-${pkgver}/

	python2 setup.py build

	python2 setup.py install --prefix="${pkgdir}"/usr
}
