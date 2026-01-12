# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=python-himitsu
_name=py-himitsu
pkgver=0.0.10
pkgrel=2
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
	"4c6ec77f821537128f0eca43455f40ca8d623088bdc4a367ff6915ddde1e9983"
)

package() {
	cd "${_name//-/_}-$pkgver"
	make DESTDIR=$pkgdir install
}
