pkgname=fluyer
pkgver=1.3.0
pkgrel=1
pkgdesc="Music Player"
arch=('x86_64')
url="https://github.com/luneflu/Fluyer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Fluyer_${pkgver}_amd64.deb")
sha256sums_x86_64=('e19a808993ea9eac6976d5d20f42309f6fc11ea329582e4ebb3fe89fb6973e86')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
