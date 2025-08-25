pkgname=garoa-beta
pkgver=0.3.0~beta.0
_upstream=0.3.0-beta.0
pkgrel=1
pkgdesc="Garoa - Home of discipline (Beta release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${_upstream}/Garoa.Beta_${_upstream}_amd64.deb")
sha256sums_x86_64=('b91ae0ed7ab3b8c2ae209b4f675e159999b38605f94c33bfa823a9a6aadcc0a1')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
