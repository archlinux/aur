# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck disable=SC2034,SC2164

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.20.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cb8e4a1a8453f46a6f5d0669ba43d79535a8c5faa7a1fb75a3700b77a3c0f8bc')
sha256sums_aarch64=('0d8cb2c88660815ca181928e61ef327a3ff294307200b1e5cf6ab03f39412f58')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
