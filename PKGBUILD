pkgname=crosscode
pkgver=0.0.4
pkgrel=1
pkgdesc="Cross platform iOS IDE"
arch=('x86_64')
url="https://github.com/nab138/CrossCode"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/CrossCode_${pkgver}_amd64.deb")
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
sha256sums_x86_64=('7019323ad1ef7e87e995ba5c7eeee8664172548b5bad42d30b33d4a86214ba0d')
