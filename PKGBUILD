# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck disable=SC2034,SC2164

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.21.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('069065d58a8f0d7a1e116fe87aa1fe375d1b405cdd2e93f42df12e1d87219ea6')
sha256sums_aarch64=('f203dfe97806694f488e045ffc807f9e07668139d8442d348e0a56939286d619')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
