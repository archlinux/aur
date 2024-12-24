# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_rc.6
pkgrel=1
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/algohub-v${pkgver//_/-}/algohub_${pkgver//_/-}_amd64.deb")
sha256sums_x86_64=('32776b45e566614226ae55ce9e2973e26671562bf752db061fbcf22723203b92')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
  echo "[Desktop Entry]
Categories=Network;
Comment=ACM Algorithm Hub
Exec=WEBKIT_DISABLE_COMPOSITING_MODE=1 algohub
Icon=algohub
Name=algohub
Terminal=false
Type=Application
" > "${pkgdir}/usr/share/applications/algohub.desktop"
}
