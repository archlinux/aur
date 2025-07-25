pkgname=fluyer
pkgver=1.0.1
pkgrel=1
pkgdesc="Music Player"
arch=('x86_64')
url="https://github.com/alvindimas05/Fluyer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'mpv')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Fluyer_${pkgver}_amd64.deb")
sha256sums_x86_64=('841c6110f0dddf436bcbdef16716fc9a5b1ff235fbbb4bb1021365e25fa90954')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
