# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Crossplatform package manager"
arch=(x86_64)
url="https://gofi.sh/index.html"
license=('Apache')
source_x86_64=("https://gofi.sh/releases/gofish-v$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('d49ea94fb663386cdefa236f52deae9126254ab41afc614a9ddfdf9650108e2f')

package() {
    cd "$srcdir/"
    install -Dm755 "gofish" "$pkgdir/usr/bin/gofish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

