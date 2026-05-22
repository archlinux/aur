# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.3.2
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.3.2/linux-x86_64/logw2_0.3.2_amd64.deb")
sha256sums_x86_64=('736fb4787e02eeaa8c9fe1dfb883d499b5e73f6bfd17a7688e21af6b791d1c9c')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}