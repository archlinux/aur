# Maintainer: ebcrowder <ebcrowder@gmail.com>
pkgname=rust_ledger-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="CLI accounting tool"
url="https://github.com/ebcrowder/rust_ledger"
license=("GPL-3.0")
arch=("x86_64")
provides=("rust_ledger")
source=("https://github.com/ebcrowder/rust_ledger/releases/download/v$pkgver/rust_ledger-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("61b425dd808ccb4e9514a4f16025f9e0d57e2f54d483ba4c717e57e1b8d10260")

package() {
    tar xzf rust_ledger-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
    cd rust_ledger-v$pkgver-x86_64-unknown-linux-gnu
    install -Dm 755 "rust_ledger" "${pkgdir}/usr/bin/rust_ledger"
}
