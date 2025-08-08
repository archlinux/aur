pkgname=garoa-beta
pkgver=0.2.0~beta.0
_upstream=0.2.0-beta.0
pkgrel=1
pkgdesc="Garoa - Home of discipline (Beta release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${_upstream}/Garoa.Beta_${_upstream}_amd64.deb")
sha256sums_x86_64=('538746fcf1c48cb7ab11c8e40fdb75ebbd25bd9c271054ee8753f93983da0edc')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
