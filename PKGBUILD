# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.12.2
pkgrel=2
pkgdesc="Crossplatform package manager"
arch=(x86_64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://gofi.sh/releases/gofish-v$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=("6a09677d5104384057dcde2985bd03b033fafeb012898af518d9bd23d607a217")
package() {
    cd "$srcdir/"
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

