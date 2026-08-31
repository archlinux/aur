pkgname=fluyer
pkgver=1.3.6
pkgrel=1
pkgdesc="Music Player"
arch=('x86_64')
url="https://github.com/luneflu/Fluyer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Fluyer_${pkgver}_amd64.deb")
sha256sums_x86_64=('02eee8f20c2379e9891b1ddf9e180ccffade4ab5a50de9d2bcfd17d23803e8be')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
