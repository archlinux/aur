# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.5
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.5/linux-x86_64/logw2_0.2.5_amd64.deb")
sha256sums_x86_64=('3c85ba145eb1394f7a51f581db12bca847813b6ebedc693172b182a9209185aa')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}