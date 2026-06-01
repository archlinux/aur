# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=python-cmdln
pkgver=2.0.0
pkgrel=2
pkgdesc='a Python module for easily building good multi-command scripts'
arch=('i686' 'x86_64')
url='http://github.com/trentm/cmdln'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('cmdln')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trentm/cmdln/archive/${pkgver}.tar.gz")
sha256sums=('5545a51770d494b9297dce4e2ad2d06efbd133d29184e97393710dec954cb6e4')

build() {
	cd cmdln-${pkgver}/

	python setup.py build
}

package() {
	cd cmdln-${pkgver}/

	python setup.py install --prefix="${pkgdir}"/usr
}
