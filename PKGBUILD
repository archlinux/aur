# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen-nerd-font")
pkgver=1.0.44
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen - Nerd Font"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen-NerdFont.ttf")
b2sums=('6ce76cde67128662bf26c7a2c1dd6954236f8f87ca3dcacdbcc2bf61673d9cd80b193038b206df5848ab21ac64a3aba82ca084ea657c796d049e7efb1e8a40b0')

package() {
    install -D -m 644 "NeoSpleen-NerdFont.ttf" -t "$pkgdir/usr/share/fonts/TTF"
}
