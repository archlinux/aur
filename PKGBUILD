# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.2.12
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python-setuptools' 'python-veryprettytable' 'python-beautifulsoup4' 'python-termcolor' 'python-colorama')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vikstrous/pirate-get/archive/v${pkgver}.tar.gz")
sha256sums=('1040ee051710b3d6ab8c59f5c6ffec24f003fd590a6f88373598bd09242a9063')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
}
