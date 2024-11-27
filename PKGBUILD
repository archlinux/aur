# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_nightly.11
pkgrel=1
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/algohub-v0.1.1-nightly.11/algohub_0.1.1-nightly.11_amd64.deb")
sha256sums=('2d141a79a64709c187cc2a01ff3a97ce73d6c5f8498bc77b9a094d9a2b406faf')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
