# Maintainer: RubenKelevra <ruben+aur-python-uptime@vfn-nrw.de>

pkgname=python-uptime
pkgver=3.0.2~nightly
pkgrel=1
pkgdesc="This module provides a cross-platform way to retrieve system uptime and boot time."
arch=('any')
url="https://github.com/Cairnarvon/uptime"
license=('BSD')
#depends=('')
#source=("${url}/archive/${pkgver}.tar.gz")
_commit='1ddfd06bb300c00e6dc4bd2a9ddf9bf1aa27b1bb'
source=("${pkgname}-${pkgver}.zip::https://codeload.github.com/Cairnarvon/uptime/zip/${_commit}")
sha256sums=('c034ac0dab8aef7332f4ee123f0be2e2e4f1afff9e08b5159ae115698a48a727')


build() {
	#cd "${srcdir}/uptime-${pkgver}"
	cd "${srcdir}/uptime-${_commit}"
}

package() {
	#cd "${srcdir}/uptime-${pkgver}"
	cd "${srcdir}/uptime-${_commit}"
	python setup.py install --root="$pkgdir"
}
