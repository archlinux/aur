# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.2.1
pkgrel=1
pkgdesc="BitTorrent streaming software with no paws in the way—watch anime in real-time, no waiting for downloads!"
arch=("x86_64")
url="https://github.com/RockinChaos/Shiru"
license=("GPL-3.0")
provides=("shiru")
options=("!strip")
source=("https://github.com/RockinChaos/Shiru/releases/download/v${pkgver}/linux-Shiru-v${pkgver}.AppImage"
        "shiru.png"
        "shiru.desktop")
sha256sums=("e0b6722df45585a5957854228a9f6cb5ee7385e973b77c6eb79bbaad3efa3dbc"
            "379cccb8c101876ebfdab2684ed50a3e3ddb1e1250daca752bd24597bf7eaab3"
            "11ca7ef052a2273e874ebb18a4ab5433c03858af3c40afab467404377d72ab25")

package() {
  install -Dm755 "$srcdir/linux-Shiru-v${pkgver}.AppImage" "$pkgdir/usr/bin/shiru"
  install -D "$srcdir/shiru.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png"
  install -D "$srcdir/shiru.desktop" "$pkgdir/usr/share/applications/shiru.desktop"
}
