# Maintainer: Trevin Jones <tr3vinj at gmail dot com>
pkgname=zmk-studio-bin
pkgver=0.3.1
pkgrel=2
pkgdesc="A tool for runtime keymap updates on ZMK-powered devices without reflashing firmware."
arch=('x86_64')
url="https://github.com/zmkfirmware/zmk-studio"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/zmkfirmware/zmk-studio/releases/download/v$pkgver/ZMK.Studio_"$pkgver"_amd64.deb")
sha256sums_x86_64=('7a4c640d0c9d200de4fcb30a02082d642d54e741c7fcdb279866f48eaefa1289')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
