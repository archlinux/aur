# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=win12-desktop-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Desktop version for Win12, the web desktop experience with app ecosystem and AI Copilot."
arch=('x86_64')
url="https://github.com/win12-online/win12-desktop"
license=('EPL-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/Win12_${pkgver}_amd64.deb")
sha256sums_x86_64=('2c7004391909d927515611da72ec3c2e2e2b6a3c378529b1ddd231a3b9106862')
package() {
  # Extract package data
  tar -xf data.tar.gz -C "${pkgdir}"

}
