# Maintainer: dii2r2
# Contributor:
pkgname=logw2
pkgver=0.5.3
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'dotnet-runtime-8.0' 'dotnet-sdk-8.0' 'libappindicator')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.5.3/linux-x86_64/logw2_0.5.3_amd64.deb")
sha256sums_x86_64=('e40b05946047aa863377b815ea495cc03823a8d072669900f99257617f9b6607')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
