# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=hashcards-bin
_pkgname=hashcards
pkgver=0.3.0
pkgrel=4
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards/"
license=("Apache-2.0")

pkgdesc='Command line interface to manage clipboard'

source_x86_64=("hascards-$pkgver.tar.gz::https://github.com/eudoxia0/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('fe44b36df23cb3b6a2abeef90d987e93b539dbe7100a668ac8754575867e08a96dea021cbbcd746a51a180d805e3822c21ccb4798943e82bb1159c57de7e2fbd')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-linux-amd64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
