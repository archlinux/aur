# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Crossplatform package manager"
arch=(x86_64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://github.com/tinned-fish/gofish/releases/download/v$pkgver/gofish-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('02f874ce3ddc34e6a63c3f9632261733b65f15c8f6b3afa18c4f06d1a53121f2')

package() {
    cd "$srcdir/"
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

