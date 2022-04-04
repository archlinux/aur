# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.4.2
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python-setuptools' 'python-veryprettytable' 'python-beautifulsoup4' 'python-termcolor' 'python-colorama' 'python-pyperclip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vikstrous/pirate-get/archive/${pkgver}.tar.gz")
sha256sums=('6ea9fac2505ea02bf4914c83975f1a9f341e1a4ed16282a86250ceddfbd475ef')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
}
