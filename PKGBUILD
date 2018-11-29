# Maintainer: Katie Wolfe <katie@dnaf.moe>

_lua_version=5.3

pkgname=fennel
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
groups=()
depends=('lua')
makedepends=()
checkdepends=()
optdepends=()
provides=(fennel)
conflicts=(fennel)
replaces=()
backup=()
options=()
install=
changelog=
source=("fennel-${pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('84e2afd1d338edc02d0c61bb0201d81c')
validpgpkeys=()

package() {
	cd "$srcdir/Fennel-${pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
