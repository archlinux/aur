# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_nightly.14
pkgrel=1
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/algohub-v0.1.1-nightly.14/algohub_0.1.1-nightly.14_amd64.deb")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
