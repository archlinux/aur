# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.8
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.8/linux-x86_64/logw2_0.2.8_amd64.deb")
sha256sums_x86_64=('ca6ce611713f087872176e591774375883466166ad2424240b4f01a08585e6f8')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}