# Maintainer: Tuxand <onemorelag at gmail dot com>
pkgname=kakwafont
pkgver=0.1.1
pkgrel=1
pkgdesc="Another 12px monospace bitmap font."
arch=('any')
url="https://github.com/kakwa/kakwafont"
license=('SIL Open Font License, Version 1.1')
depends=(
    "xorg-font-utils"
)

source_x86_64="https://github.com/kakwa/$pkgname/archive/$pkgver.tar.gz"
sha1sums_x86_64=('c24ba4a832e24c2e6d928cb345a9d12991dc64c2')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install FONTDIR=$pkgdir/usr/share/fonts/misc/
}