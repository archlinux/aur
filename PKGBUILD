# Maintainer: zarak <jean@bobine.com>

pkgname=term_size
pkgver=2
pkgrel=1
epoch=
pkgdesc="change current term's size"
arch=()
url="http://example.com"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('a3f96875c6750d4a9e750a49960146a4')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
