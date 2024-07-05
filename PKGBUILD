# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen")
pkgver=1.0.44
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen.ttf")
b2sums=('6921d4b3bdf0b9180f3ff41ad84d55c56f22e39dcbba6b7077c1c3dd7fe65fc05ff507f801273c1bd37c014e1d299cdff6bce44f075fac68fc6bf52a3a9d9f13')

package() {
    install -D -m 644 "NeoSpleen.ttf" -t "$pkgdir/usr/share/fonts/TTF"
}
