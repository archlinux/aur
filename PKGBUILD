pkgname=garoa
pkgver=0.3.0
pkgrel=1
pkgdesc="Garoa - Home of discipline (Stable release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Garoa_${pkgver}_amd64.deb")
sha256sums_x86_64=('27a60dfba1ab508004173e4c382bd7b5067c058f54b89f53be93bbe4cecb84f1')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
