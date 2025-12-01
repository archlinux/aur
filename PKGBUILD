# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont
pkgname=tchap-desktop
pkgver=4.18.0
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good' 'libappindicator' 'libayatana-appindicator' 'sqlcipher')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/Tchap_${pkgver}_amd64.deb")
sha256sums_x86_64=('7b227902c34a55f43386719139dd1c5a98c16dd693ea08e6841ff07026d1e889')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
