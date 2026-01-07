# Maintainer: ckaznable<ckaznable@gmail.com>
pkgname=dive-ai
pkgver=0.12.3
pkgrel=1
pkgdesc="Dive is an open-source MCP Host Desktop Application that seamlessly integrates with any LLMs supporting function calling capabilities. ✨"
arch=('x86_64')
url="https://github.com/OpenAgentPlatform/Dive"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/dive_${pkgver}_amd64.deb")
sha256sums_x86_64=('9e26e0dc6b26c1a7c24b2b93e0d06cfde87145238eacaa4cba1d184a6efe9345')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
