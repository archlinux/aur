# Maintainer: JonasAlv
pkgname=zap-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple web wrapper for whatsapp web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/zap-rs_${pkgver}_amd64.deb")
sha256sums_x86_64=('ca85f11732765bed78f93f55397b4b4cbb76685088553dad612c5062e3ec651f')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
