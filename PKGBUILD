pkgname=garoa-beta
pkgver=0.1.0~beta.8
_upstream=0.1.0-beta.8
pkgrel=1
pkgdesc="Home of discipline"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${_upstream}/Garoa.Beta_${_upstream}_amd64.deb")
sha256sums_x86_64=('852c302d7865d1091a4f155adfef290b3dea64f2d091fc6a7c0e2928a345250f')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
