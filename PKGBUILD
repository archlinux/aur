# Maintainer: zarak <jean@bobine.com>

pkgname=term_size
pkgver=3
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
md5sums=('9b35c91288b8f2268d7fa9f39dbfd16e')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
