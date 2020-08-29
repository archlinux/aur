# Maintainer: ebcrowder <ebcrowder@gmail.com>
pkgname=rust_ledger-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI accounting tool"
url="https://github.com/ebcrowder/rust_ledger"
license=("GPL-3.0")
arch=("x86_64")
provides=("rust_ledger")
options=("strip")
source=("https://github.com/ebcrowder/rust_ledger/releases/download/v$pkgver/rust_ledger-$pkgver-x86_64.tar.gz")
sha256sums=("d7c137e88ea806f8e4ace3c9f75e1101a114701f880ba52a77c539259903d913")

package() {
    install -Dm755 rust_ledger -t "$pkgdir/usr/bin/"
}
