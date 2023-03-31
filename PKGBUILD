# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=clangbincc
pkgver=0.1
pkgrel=1
pkgdesc="Relink /bin/cc to clang"
arch=('any')
license=('GPL')
depends=('clang')
provides=('cc')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha256sums=('c9326720d93b264fb9cb9da80196c875c04555e6718c67278d005033de3101db')

package() {
	cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
