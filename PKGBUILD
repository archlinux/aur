# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=python-himitsu
_name=py-himitsu
pkgver=0.0.8
pkgrel=1
pkgdesc='Himitsu client module for python'
url='https://git.sr.ht/~apreiml/py-himitsu'
license=(MIT)
arch=(x86_64 aarch64)
depends=(python)
makedepends=(python-build python-installer)
source=(
	https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz
)
sha256sums=(
	"82e3284be23a0f3ed24b1997bd3f9f931fe3a5844702224f67ee6817d750e580"
)

package() {
	cd "${_name//-/_}-$pkgver"
	make DESTDIR=$pkgdir install
}
