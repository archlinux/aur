# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64)
license=(MPL2)
provides=(mdbook)
conflicts=(mdbook)
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a5f6c15107fd5a6c933bbed167d8c130676fa7a0cde225b86fb7fea0e88ac975')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
