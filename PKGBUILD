# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont, Tsokar
pkgname=tchap-desktop
pkgver=4.23.0
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good' 'libappindicator' 'libayatana-appindicator' 'sqlcipher')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/Tchap-prod_${pkgver}_amd64.deb")
sha256sums_x86_64=('0f79ac9a9f245b992d2d548ceeba33494627471afefea86e9600be4d5977bce5')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
