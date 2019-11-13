# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64)
license=(MPL2)
provides=(mdbook)
conflicts=(mdbook)
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c457371017737ebb2c3b6553712d6ab53dda1949397770eb270e5caf2a7080f3')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
