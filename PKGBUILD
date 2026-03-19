# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.7
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.7/linux-x86_64/logw2_0.2.7_amd64.deb")
sha256sums_x86_64=('d61a84684635483807e90fd9c535cfc81a398b013c5de4b52e1942172e767287')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}