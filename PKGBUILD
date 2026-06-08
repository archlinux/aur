# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=hashcards-bin
_pkgname=hashcards
pkgver=0.3.1
pkgrel=4
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards/"
license=("Apache-2.0")

pkgdesc='A plain text-based spaced repetition system.'

source_x86_64=("hascards-$pkgver.tar.gz::https://github.com/eudoxia0/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('4554bc97eb3ecccf81c027750f3cd0d641354526cc6810aeee28e20a64867a7d2016d2631ac1838892426534b7ec3f4b6c9b6c38543790baeb0ae1f4180cdb41')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-linux-amd64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
