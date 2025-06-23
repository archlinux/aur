# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=did
pkgname="python-${_name}"
pkgver=0.22
pkgrel=1
pkgdesc='What did you do last week, month, year?'
arch=('any')
url="https://github.com/psss/did"
makedepends=('python-setuptools')
license=('GPL2')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=('python')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(a0ab60b7d6f162810ce227bf5d21b1e891c0f4f016ecc236c6bca74983051182)

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

