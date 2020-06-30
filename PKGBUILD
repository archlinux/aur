# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.4.0
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python-setuptools' 'python-veryprettytable' 'python-beautifulsoup4' 'python-termcolor' 'python-colorama' 'python-pyperclip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vikstrous/pirate-get/archive/v${pkgver}.tar.gz")
sha256sums=('0d572b69cf0d895327074c0626a984c33de2f77879ad6e85ae06eb15af9169bf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
}
