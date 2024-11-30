# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=algohub
pkgver=0.1.1_alpha.5
pkgrel=2
pkgdesc="ACM Algorithm Hub"
arch=('x86_64')
url="https://github.com/swpu-acm/algohub.git"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/swpu-acm/algohub/releases/download/${pkgver//_/-}/algohub_${pkgver//_/-}_amd64.deb")
sha256sums_x86_64=('b2b3b877c5570aadaa0b14a56a3bf5c7c95a6d9611e1dbd5261fd810fbe04fd0')
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
