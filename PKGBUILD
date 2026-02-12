# Maintainer: northernorca <sk-orcawhale@proton.me>
pkgname=dm-note-bin
pkgver=1.5.1+linux.1
pkgrel=1
pkgdesc="Unofficial Linux Implementation for DM NOTE: A Fully Customizable Key Viewer Optimized for DJMAX RESPECT V, Ready for Any Games"
arch=('x86_64')
url="https://github.com/northernorca/DmNote"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gst-plugins-good' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/DM.NOTE_${pkgver}_amd64.deb")
sha256sums_x86_64=('556860bfbf6d3391dd2fe4c12079bd2ced3a6b59b03a5a2e41f488c55720adf9')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
