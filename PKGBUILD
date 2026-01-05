pkgname=holocure-buddy
pkgver=2.0.5
pkgrel=1
pkgdesc="A companion app for HoloCure that tracks progress and provides random character selection"
arch=('x86_64' 'aarch64')
url="https://github.com/dj-piplup/holocure-buddy-tauri"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${url}/releases/download/v${pkgver}/Holocure.Buddy_${pkgver}_amd64.deb")
sha256sums=('857df865cf25f791a6541b3a14a1452bb3236a7ba27496914d9b1e17204aabe7')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
