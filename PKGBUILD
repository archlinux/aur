# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Rust"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gcc-libs' 'glibc' 'openssl' 'gst-plugins-good')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku_"$pkgver"_amd64.deb")
sha256sums_x86_64=('eea7bae8624ba256ee07b223b371f42975d86ea0eb74d43c6138def90a9f0c35')

package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
