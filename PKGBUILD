# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.14.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3707786812a07102414ebd65dc59e5a909f86896db907f8deca744488f6c7e68')
sha256sums_aarch64=('df08cf00c744bd4bb73efddee6a112771cd8ee0ba19204e92ba55a4228c43e26')


package() {
    install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}

