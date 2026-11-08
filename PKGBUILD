# Maintainer: lingbopro <lingbopro@outlook.com>
# This package is also available in my GitHub repository: https://github.com/lingbopro/pkgbuild
pkgname=win12-desktop-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Desktop version for Win12, the web desktop experience with app ecosystem and AI Copilot."
arch=('x86_64')
url="https://github.com/win12-online/win12-desktop"
license=('EPL-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/Win12_${pkgver}_amd64.deb")
sha256sums_x86_64=('258755f2c8ef0ce1f26be0dba3d465c9602610125fa53e1d5a905aba8e7ba778')
package() {
  # Extract package data
  tar -xf data.tar.gz -C "${pkgdir}"

}
