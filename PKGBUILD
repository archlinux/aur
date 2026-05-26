# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont, Tsokar
pkgname=tchap-desktop
pkgver=4.19.7
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good' 'libappindicator' 'libayatana-appindicator' 'sqlcipher')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/Tchap-prod_${pkgver}_amd64.deb")
sha256sums_x86_64=('aceb1276fc20f5201d8cfa4699c840053317860022634011548f5b2e715b507a')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
