# Maintainer: northernorca <sk-orcawhale@proton.me>
pkgname=dm-note-bin
pkgver=1.6.0+linux.1
pkgrel=1
pkgdesc="Unofficial Linux Implementation for DM NOTE: A Fully Customizable Key Viewer Optimized for DJMAX RESPECT V, Ready for Any Games"
arch=('x86_64')
url="https://github.com/northernorca/DmNote"
license=('GPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gst-plugins-good' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/DM.NOTE_${pkgver}_amd64.deb")
sha256sums_x86_64=('66c34d6d9318bd4d4fd41973fcaaa56c59890c15e29c074a1c861cd4f086c4f8')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
