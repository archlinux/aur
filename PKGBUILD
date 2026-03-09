# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.5.1
pkgrel=1
pkgdesc="A personal anime library manager for watching and tracking your collection in real time. Lightweight, powerful, and paws-itively fast. No waiting required!"
arch=("x86_64")
url="https://github.com/RockinChaos/Shiru"
license=("GPL-3.0")
provides=("shiru")
options=("!strip")
source=("https://github.com/RockinChaos/Shiru/releases/download/v${pkgver}/linux-Shiru-v${pkgver}.AppImage"
        "shiru.png"
        "shiru.desktop")
sha256sums=("87183bcb8c43d9ade6ce31790aa8ffd381de4fd46baaa47f925c7c3f50091c15"
            "2bbe68a752d1a96e4a4c97201cf2d15aef90284493f17619f528ab50f5729a60"
            "a2e60380f01e375762a7002ffd04b1b710d404ea240e413abe9747c4dd075c9f")

package() {
  install -Dm755 "$srcdir/linux-Shiru-v${pkgver}.AppImage" "$pkgdir/usr/bin/shiru"
  install -D "$srcdir/shiru.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png"
  install -D "$srcdir/shiru.desktop" "$pkgdir/usr/share/applications/shiru.desktop"
}
