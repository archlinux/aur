# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.4.3
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'dotnet-runtime-8.0' 'dotnet-sdk-8.0')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.4.3/linux-x86_64/logw2_0.4.3_amd64.deb")
sha256sums_x86_64=('fc32fda2c42ef97e4e0fd31e24f3512639ee8c2206b1f4daa606cceeb1bec15b')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
