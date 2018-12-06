# Maintainer: Katie Wolfe <katie@dnaf.moe>

_lua_version=5.3

pkgname=fennel
pkgver=0.1.1
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
md5sums=('07bb2529aa858ff7263cad665320bec2')
validpgpkeys=()

package() {
	cd "$srcdir/Fennel-${pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
