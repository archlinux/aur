pkgname=fluyer
pkgver=1.1.0
pkgrel=1
pkgdesc="Music Player"
arch=('x86_64')
url="https://github.com/alvindimas05/Fluyer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'mpv')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Fluyer_${pkgver}_amd64.deb")
sha256sums_x86_64=('f6af9881eb4bb3816c3f49958a42e0b0236767b4d5d39238f88c58686835a9f1')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
