# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.18.1
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9767b1e8b0b364df1791376d912f95601c10c0cc514f592d7b140ee9aff03fc0')
sha256sums_aarch64=('cb4f72bba987b5ddb80189d125561795f5d917e6fce455d92a4277ddad9ac0a8')

package() {
  install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
