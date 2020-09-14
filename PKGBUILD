# Maintainer: ebcrowder <eric@ebcrowder.dev>
pkgname=rust_ledger-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="CLI accounting tool"
url="https://github.com/ebcrowder/rust_ledger"
license=("GPL-3.0")
arch=("x86_64")
provides=("rust_ledger")
source=("https://github.com/ebcrowder/rust_ledger/releases/download/v$pkgver/rust_ledger-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("989141325e2fade2dd521956feda68182b346566ae7bcb09daa99e6fbac6f7b7")

package() {
    tar xzf rust_ledger-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
    cd rust_ledger-v$pkgver-x86_64-unknown-linux-gnu
    install -Dm 755 "rust_ledger" "${pkgdir}/usr/bin/rust_ledger"
}
