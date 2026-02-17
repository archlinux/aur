# Maintainer: northernorca <sk-orcawhale@proton.me>
pkgname=dm-note-bin
pkgver=1.5.2+linux.1
pkgrel=1
pkgdesc="Unofficial Linux Implementation for DM NOTE: A Fully Customizable Key Viewer Optimized for DJMAX RESPECT V, Ready for Any Games"
arch=('x86_64')
url="https://github.com/northernorca/DmNote"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gst-plugins-good' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/DM.NOTE_${pkgver}_amd64.deb")
sha256sums_x86_64=('ecc77fb828ebd032b78280b2fbbaadf5436a47a336a2774d6ce10d47d49e2b7c')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
