# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.13.0
pkgrel=2
pkgdesc="Crossplatform package manager"
arch=(x86_64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://gofi.sh/releases/gofish-v$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=("ce00ca1451cc3a04b62ee8dc0d007bf8df8ae3340489bf4c2f204a3527a91c0b")
package() {
    cd "$srcdir/"
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

