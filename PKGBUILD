# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.5.2
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
sha256sums=("18d4b6dc9b53fbd44172c2352ced7b7a7f5a75016d672258b57dc4e79521043d"
            "2bbe68a752d1a96e4a4c97201cf2d15aef90284493f17619f528ab50f5729a60"
            "bcbf6d336a50196ed73a17e5acd36f66a5e813d7004a1d947f542a6919f3aebd")

package() {
  install -Dm755 "$srcdir/linux-Shiru-v${pkgver}.AppImage" "$pkgdir/usr/bin/shiru"
  install -D "$srcdir/shiru.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png"
  install -D "$srcdir/shiru.desktop" "$pkgdir/usr/share/applications/shiru.desktop"
}
