# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.3.5
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python-setuptools' 'python-veryprettytable' 'python-beautifulsoup4' 'python-termcolor' 'python-colorama')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vikstrous/pirate-get/archive/v${pkgver}.tar.gz")
sha256sums=('8b053aab32dad8f985e9fb7f36c39254373a51cebcdbcfca4c69e0de127f4807')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
}
