# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel-bin
_pkgname=rust-parallel
pkgver=1.13.1
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('769da21e7c077dc2a5c6aa295725acf39b97a43b1af28c6e0dc1ab9b24247dc0')
sha256sums_aarch64=('f3d5b2f7f4cf4fc944330401432d7e535f8423152c141667eab67e7823c923e7')


package() {
    install -Dm 755 rust-parallel -t "$pkgdir/usr/bin"
}

