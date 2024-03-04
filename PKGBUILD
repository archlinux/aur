# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.16.1
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a2815e67d5ea69a2eaedc6509b2058fb07466a8f1355f76ec1f48515bfb98ee7')
sha256sums_aarch64=('f770cd701734828ff1c2e0c220012a20be7f7bb6fcf92a1a9a5ed36df33b8cb4')

package() {
	install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
