# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.6
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.6/linux-x86_64/logw2_0.2.6_amd64.deb")
sha256sums_x86_64=('23fbd535001f32f4c2de22c41f047d968b13065a2c8e885ba37a56cba20612f9')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}