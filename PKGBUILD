# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.2.11
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python-setuptools' 'python-veryprettytable' 'python-beautifulsoup4' 'python-termcolor' 'python-colorama')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vikstrous/pirate-get/archive/v${pkgver}.tar.gz")
sha256sums=('b568e94f463e99e0f9b6751c67090a63ed00c2b340be9100ff7105cb5a42f429')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
}
