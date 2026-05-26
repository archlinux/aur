# Maintainer: Brandon Greenwell <greenwell.brandon@gmail.com>

pkgname=doxx-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal document viewer for .docx files"
url="https://github.com/bgreenwell/doxx"
license=("MIT")
arch=("x86_64")
provides=("doxx")
conflicts=("doxx")
source=("https://github.com/bgreenwell/doxx/releases/download/v$pkgver/doxx-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("ebac222bfe04ac3a776277c0fc9dd40f8564070bf020330f593ee77ac2b426e0")

package() {
    cd "$srcdir/doxx-x86_64-unknown-linux-gnu"
    install -Dm755 doxx -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
