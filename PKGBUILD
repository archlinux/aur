# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont, Tsokar
pkgname=tchap-desktop
pkgver=4.19.4
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good' 'libappindicator' 'libayatana-appindicator' 'sqlcipher')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/Tchap_${pkgver}_amd64.deb")
sha256sums_x86_64=('ddc4a5942d5590ec832e2db410adb9361eb7695a636b2ec67c3128841ffcebd2')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
