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
source=("https://github.com/ebcrowder/rust_ledger/releases/download/v$pkgver/rust_ledger-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("6ad63dac12d587e8333ec2624aca364db835037c6c42304058dfa0bde5f76503")

package() {
    install -Dm755 rust_ledger -t "$pkgdir/usr/bin/"
}
