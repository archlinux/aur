pkgname=crosscode
pkgver=0.0.2
pkgrel=1
pkgdesc="Cross platform iOS IDE"
arch=('x86_64')
url="https://github.com/nab138/CrossCode"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/CrossCode_${pkgver}_amd64.deb")
sha256sums_x86_64=('913d5662dd581e7b2aedf06c3267039ca85c45677ae71aa64695c93b3e152102')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}