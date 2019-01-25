# Maintainer: Katie Wolfe <katie@dnaf.moe>

_lua_version=5.3

pkgname=fennel
_pkgver='0.2.1-2'
pkgver=0.2.1_2
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
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
noextract=()
md5sums=('006cae820d6e767a96ffa1d7dd5754fa')
validpgpkeys=()

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
