# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=hashcards-bin
_pkgname=hashcards
pkgver=0.2.1
pkgrel=4
arch=('x86_64')
url="https://github.com/eudoxia0/hashcards/"
license=("Apache-2.0")

pkgdesc='Command line interface to manage clipboard'

source_x86_64=("hascards-$pkgver.tar.gz::https://github.com/eudoxia0/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('818f0a942a7fb6ba4ba1e14f741aeebe01c9b7e1edc2fabb4113b781ccccc3c7dc699d53daf5aee2769dba686a8e3d7e85df6e2c1615cff5d1d0be13a1b98035')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-linux-amd64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
