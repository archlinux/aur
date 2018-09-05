# Maintainer: Hinerk <hinerk.stender@mail.de>

pkgname=python-poloniex
pkgver=0.0.17
pkgrel=1
pkgdesc='Poloniex python API client for humans'
arch=('any')
url='https://github.com/Aula13/poloniex'
license=('MIT')
depends=('python' 'python-requests' 'python-six')

source=('https://github.com/Aula13/poloniex/archive/0.0.17.tar.gz')
sha256sums=('137d3c7b2c0dd2bd007d816b023a1603968613daa012761f5439733a1219218a')

build() {
	cd "${srcdir}/poloniex-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/poloniex-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
