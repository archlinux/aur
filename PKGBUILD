# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen-nerd-font")
pkgver=1.0.44
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen - Nerd Font"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen-NerdFont.ttf")
b2sums=('4d33bc7b27e1d87632c6d151677ae030fb3c6f5007692556f043f888505fa391'
        'SKIP')

package() {
    install -D -m 644 "NeoSpleen-NerdFont.ttf" -t "$pkgdir/usr/share/fonts/TTF"
}
