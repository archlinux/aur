# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck disable=SC2034,SC2164

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.19.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9e90ba0ea2d2928e71cf172c86b0d593798328a770cb466a9be80bfaea3a1099')
sha256sums_aarch64=('bd2db111cd1a5e3578e97e47e345b288b0badcd5b86a9bb7b140e8b2fc5b3f01')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
