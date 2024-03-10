# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.17.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c737c97af93e5e281d4162e64ba23d5c16ee42a2f95aa68dc235e0fd309ff9c4')
sha256sums_aarch64=('7c1018da8048647be8f816026a0b2478661a42383e440901bf3840d0ba0d87ee')

package() {
    install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}
