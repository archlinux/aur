# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64)
license=(MPL2)
provides=(mdbook)
conflicts=(mdbook)
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4f42e0581be10b89c65007a48e4dab1f0070643498f070ea9cbd67ee92ac906e')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
