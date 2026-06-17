# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.4.2
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'dotnet-runtime-8.0' 'dotnet-sdk-8.0')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.4.2/linux-x86_64/logw2_0.4.2_amd64.deb")
sha256sums_x86_64=('ec467dcb0f017bb863dcfb64b4d6f0b7e5bee6e4d10e882c93f7acbd92587ada')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
