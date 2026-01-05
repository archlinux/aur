pkgname=holocure-buddy
pkgver=2.0.4
pkgrel=3
pkgdesc="A companion app for HoloCure that tracks progress and provides random character selection"
arch=('x86_64' 'aarch64')
url="https://github.com/dj-piplup/holocure-buddy-tauri"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${url}/releases/download/v${pkgver}/Holocure.Buddy_${pkgver}_amd64.deb")
sha256sums=('79eea9ce3e32a011e9fd639b5fc7b3362f487f3fa4d67e6f1d28228ccfd14956')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
