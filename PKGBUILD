# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64 i686)
license=(MPL2)
provides=(mdbook)
conflicts=(mdbook)
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
md5sums_x86_64=('abb927ab28b0605564c50e2bc006c9f3')
md5sums_i686=('292a85ed9d8460f92e60ca9c03bc1170')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
