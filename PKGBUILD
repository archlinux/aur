# Maintainer:
# Contributor:
pkgname=logw2
pkgver=0.2.4
pkgrel=1
pkgdesc="Logw2 desktop client for your Guild Wars 2 logs"
arch=('x86_64')
url="https://logw2.com"
license=('custom:proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://r2.logw2.com/releases/0.2.4/linux-x86_64/logw2_0.2.4_amd64.deb")
sha256sums_x86_64=('6d135a625268b7b4c1c7228758ccea332e8f7e87b413c33ed291f6122815dd17')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}