# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck disable=SC2034,SC2164

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.22.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1738ad7c372bc8e1e6e9b1007f8f701bec77cd04bf7a2c404b353af6d3a72388')
sha256sums_aarch64=('5143942dc8d9b20e828b7d9ac56ae43b7637b99b1e2b20237db4b23244e71db3')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
