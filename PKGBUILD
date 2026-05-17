# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.3.1
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.3.1/linux-x86_64/logw2_0.3.1_amd64.deb")
sha256sums_x86_64=('82591d4d556a0346f0cb59c60d2850e62ef38a202b7c71260a21dec7067da7e2')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}