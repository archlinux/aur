# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck disable=SC2034,SC2164

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.24.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9b9c82e4ba7fb485ff0a2d8ba77a1f697b8eefdf712039cd37cb63000a9c2268')
sha256sums_aarch64=('ee14bb113d576608d2c3183b966051bb03d5144da05abd9000c3d6e6130708ea')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
