# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.4.6
pkgrel=1
pkgdesc="Manage your personal media library, organize your collection, and stream your content in real time, no waiting required!"
arch=("x86_64")
url="https://github.com/RockinChaos/Shiru"
license=("GPL-3.0")
provides=("shiru")
options=("!strip")
source=("https://github.com/RockinChaos/Shiru/releases/download/v${pkgver}/linux-Shiru-v${pkgver}.AppImage"
        "shiru.png"
        "shiru.desktop")
sha256sums=("ed0d71292c4f47677de5b050842f7ed4390f8b510a438d2bddccdcc5f9e5100b"
            "2bbe68a752d1a96e4a4c97201cf2d15aef90284493f17619f528ab50f5729a60"
            "7e2b124d5e0ec388c8a5288339eeddda848c3e206ebe67377c32c49da2b17063")

package() {
  install -Dm755 "$srcdir/linux-Shiru-v${pkgver}.AppImage" "$pkgdir/usr/bin/shiru"
  install -D "$srcdir/shiru.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png"
  install -D "$srcdir/shiru.desktop" "$pkgdir/usr/share/applications/shiru.desktop"
}
