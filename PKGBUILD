# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=hashcards-bin
_pkgname=hashcards
pkgver=0.5.0
pkgrel=1
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards/"
license=("Apache-2.0")

pkgdesc='A plain text-based spaced repetition system.'

source_x86_64=("hascards-$pkgver.tar.gz::https://github.com/eudoxia0/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('40d4ff19c072de150d8710616ab3c273871c2f0587dd0128c941e7392a5c58f1b82b662d4e7a384a843280838236cf5e3503de278273aa72c8c30bcda8444415')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-linux-amd64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
