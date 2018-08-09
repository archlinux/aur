# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=('x86_64' 'i686' 'aarch64')
license=('MPL2')
provides=('mdbook')
conflicts=('mdbook')
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
md5sums_x86_64=('9f2419a35f8fd6fe9f978e05c1172fde')
md5sums_i686=('013ec337cd9d473c489efdfc81e39705')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
