# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.4.0
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'dotnet-runtime-8.0' 'dotnet-sdk-8.0')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.4.0/linux-x86_64/logw2_0.4.0_amd64.deb")
sha256sums_x86_64=('63f28a7a1ffe5c799256ca722282bd54be99c9e524c1f3b51838b89702195270')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
