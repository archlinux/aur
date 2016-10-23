# Maintainer: Stunts <f.pinamartins[at]gmail.com>
# Maintainer: Phil Schaf <flying-sheep[at]web.de>
_name=async-timeout
pkgname=python-async-timeout
pkgver=1.1.0
pkgrel=1
pkgdesc='asyncio-compatible timeout class'
arch=('any')
url="https://github.com/aio-libs/${_name}"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/aio-libs/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('6047a28d4297bac746708bfaf047cd74')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
	python setup.py install --root="${pkgdir}"
}
