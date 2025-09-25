pkgname=garoa
pkgver=0.4.0
pkgrel=1
pkgdesc="Home of discipline (Stable release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Garoa_${pkgver}_amd64.deb")
sha256sums_x86_64=('172f61b61baa155ddf011fd47d6f53784e8ca4da961bc1ed4832287425e0d342')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
