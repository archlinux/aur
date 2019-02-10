# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Crossplatform package manager"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://gofi.sh/releases/gofish-v$pkgver-linux-amd64.tar.gz")
source_i686=("https://gofi.sh/releases/gofish-v$pkgver-linux-386.tar.gz")
source_aarch64=("https://gofi.sh/releases/gofish-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=("b02451b90255f45f0093dca251849b7925ffdfbf62a192a51c8b4dbc38a45851")
sha256sums_i686=("ee4de2e5fb5135d428b07c4524ff5827126fd5c24fe73e9f3018ac9e71047399")
sha256sums_aarch64=("0c90bf6e42eb2abd3171f90be086f6804b96064df88f86c5cc2d81fb64c04ce7")
package() {
    cd "$srcdir/"linux-*
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

