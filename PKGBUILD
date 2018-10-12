# Maintainer: RubenKelevra <ruben+aur-sctp-python@vfn-nrw.de>

pkgname=python-sctp
pkgver=0.6.1~nightly
pkgrel=1
pkgdesc="pysctp is a python module for the SCTP protocol stack and library."
arch=('any')
url="https://github.com/P1sec/pysctp"
license=('LGPL')
depends=('lksctp-tools')
#source=("${url}/archive/${pkgver}.tar.gz")
_commit='4c6f117d163a163c3ed6d70ac5950f458340f425'
source=("${pkgname}-${pkgver}.zip::https://codeload.github.com/P1sec/pysctp/zip/${_commit}")
sha256sums=('eba87e1065c2f9854546535e83ba31125b7ef42664ce99ff00d2d6e3a9f57f0d')


build() {
	#cd "${srcdir}/pysctp-${pkgver}"
	cd "${srcdir}/pysctp-${_commit}"
}

package() {
	#cd "${srcdir}/pysctp-${pkgver}"
	cd "${srcdir}/pysctp-${_commit}"
	python setup.py install --root="$pkgdir"
}
