# Maintainer: Sid <sidpranjale127@protonmail.com>

pkgname=blood-demo
pkgver=0.99a
pkgrel=1
pkgdesc="Monolith's Blood, Demo files taken from Archive.org"
arch=('i686' 'x86_64' 'aarch64')
url='https://lith.com'
license=('custom: shareware')
source=('https://archive.org/download/Blood_64/BLOOD.zip')
sha256sums=('SKIP')

package() {
    rm -rf "$srcdir"/*EXE
    rm -rf "$srcdir"/*zip
    install -D -t "$pkgdir"/usr/share/games/nblood/ "$srcdir"/*
}
