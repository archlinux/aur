# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.8.0
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
sha256sums=("209babad28ba31ae76a9951d65c85bf4d2559a0d1af56f0ba60e069aa93ee230"
            "2bbe68a752d1a96e4a4c97201cf2d15aef90284493f17619f528ab50f5729a60"
            "bcbf6d336a50196ed73a17e5acd36f66a5e813d7004a1d947f542a6919f3aebd")

package() {
  install -Dm755 "$srcdir/linux-Shiru-v${pkgver}.AppImage" "$pkgdir/usr/bin/shiru"
  install -D "$srcdir/shiru.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png"
  install -D "$srcdir/shiru.desktop" "$pkgdir/usr/share/applications/shiru.desktop"
}
