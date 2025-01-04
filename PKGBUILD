# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Rust"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' )
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku_"$pkgver"_amd64.deb")
sha256sums_x86_64=('597e37814b049b7b1976f9e3ba2d7d8195dfc74fc58f409751f9704d46fad8bb')

package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
