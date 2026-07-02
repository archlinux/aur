# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont, Tsokar
pkgname=tchap-desktop
pkgver=4.20.0
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good' 'libappindicator' 'libayatana-appindicator' 'sqlcipher')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/Tchap-prod_${pkgver}_amd64.deb")
sha256sums_x86_64=('ace479370f1668f8c77b08f792258072a676645a3043b8d7b3a5dd8e1f57b1c8')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
