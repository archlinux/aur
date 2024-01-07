# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.13.0
pkgrel=2
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8345224588068d8cf4766dbf2e18a98ad74d79d084aa46a85a48f18500dbd21b')
sha256sums_aarch64=('50233726bb83dc7dc276b90d6e49c67607d39d97e493d257825649daaf89a46f')


package() {
    install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}

