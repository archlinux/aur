# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.3.0
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.3.0/linux-x86_64/logw2_0.3.0_amd64.deb")
sha256sums_x86_64=('19e402f4a024ee00c5967d96cce2ec65bed08b37c73506c8f4fd220a60beeb1c')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}