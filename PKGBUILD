# Maintainer: grimsteel <admin at vocabustudy dot org>
pkgname=miband4-gtk-bin
pkgver=0.3
pkgrel=1
pkgdesc="A GTK 4 interface for the Mi Smart Band 4"
url="https://github.com/grimsteel/miband4-gtk"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=("gtk4>=1:4.10" "bluez")
optdepends=("playerctl>=2.1.1: music sync support")
provides=("miband4-gtk")
source=(
    "https://github.com/grimsteel/miband4-gtk/releases/download/v$pkgver/miband4-gtk"
    "https://github.com/grimsteel/miband4-gtk/raw/v$pkgver/miband4-gtk.desktop"
)
sha256sums=('bb3385a4c50d57c29d52df6eb3aefa397ccb4fbaa99007e462f0c61a26aa0ff9'
            '9ddf4c4657dac126cda372923a76fc95e5c13f8889c2f75c83f474497d7f418d')

package() {
  install -Dm 755 "${srcdir}/miband4-gtk" "${pkgdir}/usr/bin/miband4-gtk"
  install -Dm 644 "${srcdir}/miband4-gtk.desktop" "${pkgdir}/usr/share/applications/miband4-gtk.desktop"
}
