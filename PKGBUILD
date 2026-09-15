# Maintainer: dii2r2
# Contributor:
pkgname=logw2
pkgver=0.5.1
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'dotnet-runtime-8.0' 'dotnet-sdk-8.0' 'libappindicator')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.5.1/linux-x86_64/logw2_0.5.1_amd64.deb")
sha256sums_x86_64=('7d923d218a6fd30aeb5364702dbc29cf479031ed110535d9819ff06bbd6bc751')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
