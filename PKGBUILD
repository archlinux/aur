pkgname=holocure-buddy
pkgver=2.0.4
pkgrel=1
pkgdesc="A companion app for HoloCure that tracks progress and provides random character selection"
arch=('x86_64' 'aarch64')
url="https://github.com/dj-piplup/holocure-buddy-tauri"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${url}/releases/download/v${pkgver}/appname_${pkgver}_amd64.deb")
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}