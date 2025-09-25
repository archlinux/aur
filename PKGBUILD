pkgname=garoa-beta
pkgver=0.4.0~beta.0
_upstream=0.4.0-beta.0
pkgrel=1
pkgdesc="Home of discipline (Beta release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${_upstream}/Garoa.Beta_${_upstream}_amd64.deb")
sha256sums_x86_64=('8275640460de04abed12a34971f917103b10e3184f19bcb1fb1d972d771431f2')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
