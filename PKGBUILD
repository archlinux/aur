# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.11
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.11/linux-x86_64/logw2_0.2.11_amd64.deb")
sha256sums_x86_64=('7a1009bbf6a7607bf4d139dcc209e9cd7156b5c3ead27321dc495f58cd899331')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}