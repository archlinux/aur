# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Rust"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gcc-libs' 'glibc' 'openssl' 'gst-plugins-good')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku_"$pkgver"_amd64.deb")
sha256sums_x86_64=('fc296cfd9f894830244e67cf7ce27667638ecfb6599943dc360f370a82cc2a73')

package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
