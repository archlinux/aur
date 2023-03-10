# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>

pkgname="ata-bin"
pkgver=2.0.1
pkgrel=0
pkgdesc="Ask the Terminal Anything"
arch=('x86_64' 'aarch64')
url="https://github.com/rikhuijzer/ata"
source=(
    "ata::https://github.com/rikhuijzer/ata/releases/download/v$pkgver/ata-$CARCH-unknown-linux-gnu"
)
md5sums=(
    'SKIP'
)
conflicts=(
    ata
    ata-git
)

package() {
    install -D $srcdir/ata $pkgdir/usr/bin/ata
}
