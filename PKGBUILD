_pkgname=monkeytype
pkgname=python-${_pkgname}
pkgver=17.12.3
pkgrel=1
pkgdesc="A system for Python that generates static type annotations by collecting runtime types"
arch=('any')
url="https://github.com/Instagram/MonkeyType"
license=("BSD")
makedepends=('python-setuptools')
depends=('python')
optdepens=()
provides=('python-monkeytype-git')
conflicts=('python-monkeytype-git')
source=(https://github.com/Instagram/MonkeyType/archive/v${pkgver}.tar.gz)
sha256sums=('c7a1c9ec3d0db124136835652496db16af8013ab3eefc737eca1c04d9c26f039')

package() {
	 cd "${srcdir}/MonkeyType-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}
