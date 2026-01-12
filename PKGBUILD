# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=python-himitsu
_name=py-himitsu
pkgver=0.0.10
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
	"45de3188fc56011f8121bba6f43bd59ebddf8d1e2e3a24e32f2479b725ec92ce"
)

package() {
	cd "${_name//-/_}-$pkgver"
	make DESTDIR=$pkgdir install
}
