pkgname=fluyer
pkgver=1.3.0
pkgrel=1
pkgdesc="Music Player"
arch=('x86_64')
url="https://github.com/luneflu/Fluyer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'mpv')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Fluyer_${pkgver}_amd64.deb")
sha256sums_x86_64=('9355dc6b9ad83f028e15c7cf4470794e4d266334ccdbd3d87c97e3e6bea1e05a')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
