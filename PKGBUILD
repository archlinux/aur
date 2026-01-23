# Maintainer: northernorca <sk-orcawhale@proton.me>
pkgname=dm-note-bin
pkgver=1.4.1+linux.2
pkgrel=1
pkgdesc="Unofficial Linux Implementation for DM NOTE: A Fully Customizable Key Viewer Optimized for DJMAX RESPECT V, Ready for Any Games"
arch=('x86_64')
url="https://github.com/northernorca/DmNote"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gst-plugins-good' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/DM_NOTE_${pkgver}_amd64.deb")
sha256sums_x86_64=('661eb811b3d406e00301b906f21e79cc9a402b201a798b326996a2074b37c225')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
