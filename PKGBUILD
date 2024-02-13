# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=did
pkgname="python-${_name}"
pkgver=0.21
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
sha256sums=('6b4f59bf77abb5469c2979a1ac7ca09d948d91d63a0ec2e98e3965968a08abb8')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

