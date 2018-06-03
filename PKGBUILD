# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr

pkgname=mdbook-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=('x86_64' 'i686' 'aarch64')
license=('MPL2')
provides=('mdbook')
conflicts=('mdbook')
source_x86_64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rust-lang-nursery/mdBook/releases/download/v${pkgver}/mdBook-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
md5sums_x86_64=('30e84401ad43e25bf4f69ded9cd29de8')
md5sums_i686=('24739cbee8dbaa2f82c11a3019816118')
md5sums_aarch64=('0954b2832119d3fd83ca6ea253251b61')

package() {
	install -D mdbook "${pkgdir}/usr/bin/mdbook"
}
