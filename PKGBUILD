# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_alpha.1
pkgrel=1
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/algohub-v0.1.1-alpha.1/algohub_0.1.1-alpha.1_amd64.deb")
sha256sums_x86_64=('5d430e52e854326ee3f6419e98a408ecc3f8d6ac10d1c91c940de16afe2e6f55')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
