# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_nightly.15
pkgrel=1
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/algohub-v0.1.1-nightly.15/algohub_0.1.1-nightly.15_amd64.deb")
sha256sums_x86_64=('0742ab335960fbbbec71212ff42ba07c50e07b2f1123359e6b1409f86a20cadf')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
