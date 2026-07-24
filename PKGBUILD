# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=hashcards-bin
_pkgname=hashcards
pkgver=0.4.0
pkgrel=4
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards/"
license=("Apache-2.0")

pkgdesc='A plain text-based spaced repetition system.'

source_x86_64=("hascards-$pkgver.tar.gz::https://github.com/eudoxia0/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('d50e7462d6563d5ef7ee6ab72ce6c7d36205cd3464da264578e464fb8d78463a603746aca11dc26adf704dde83abe4f072bd3db58acc015fb962c24a99d60d31')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-linux-amd64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
