# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Crossplatform package manager"
arch=(x86_64 i686 aarch64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://gofi.sh/releases/gofish-v$pkgver-linux-amd64.tar.gz")
source_i686=("https://gofi.sh/releases/gofish-v$pkgver-linux-386.tar.gz")
source_aarch64=("https://gofi.sh/releases/gofish-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=("6d0fcc98379ea0bed99fffae7529dbc713591717e6905422fd30690fdd728706")
sha256sums_i686=("57962c979765f221a55004854fa040fb6126b41ed2c22dda3dc5922eb08f5aa1")
sha256sums_aarch64=("773105edcc7ea70a1b0c6d3f9202a7a8133a7084c929b719850f84d4fd9ab301")
package() {
    cd "$srcdir/"linux-*
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

