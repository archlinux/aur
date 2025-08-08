pkgname=garoa
pkgver=0.2.0
pkgrel=1
pkgdesc="Garoa - Home of discipline (Stable release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Garoa_${pkgver}_amd64.deb")
sha256sums_x86_64=('ea58d8292017e87297eb83c8331a71dc21473a068aef1f89aee1857dcc33b4d6')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
