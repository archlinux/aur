# Maintainer:
# Contributor: Arnaud DURAND <durandarnaud44@free.fr>, Gwendal Beaumont
pkgname=tchap-desktop
pkgver=4.17.1
pkgrel=1
pkgdesc="Desktop app for Tchap."
arch=('x86_64')
url="https://github.com/tchapgouv/tchap-desktop"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-plugins-good')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tchap-${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('bf69e0568d29329843bff575fe12bc154a549dba23375ab4e6834d9f143ea144')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
