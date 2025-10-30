# Maintainer: ckaznable<ckaznable@gmail.com>
pkgname=dive-ai
pkgver=0.9.11
pkgrel=1
pkgdesc="Dive is an open-source MCP Host Desktop Application that seamlessly integrates with any LLMs supporting function calling capabilities. ✨"
arch=('x86_64')
url="https://github.com/OpenAgentPlatform/Dive"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/dive_${pkgver}_amd64_linux.deb")
sha256sums_x86_64=('900ba0b917ffdd1f7e9c0389143a4917ca9cc251f36bb65598acada810d7f45f')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
