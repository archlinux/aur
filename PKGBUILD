# Maintainer: @JonasAlv
pkgname=zap-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple and minimal web wrapper for whatsapp web"
arch=(x86_64)
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v0.1.0/zap-rs_0.1.0_amd64.deb")
sha256sums_x86_64=('SKIP')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
