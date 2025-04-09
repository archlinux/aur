# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Rust"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gcc-libs' 'glibc' 'openssl' 'gst-plugins-good')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku_"$pkgver"_amd64.deb")
sha256sums_x86_64=('9516719516c8c860dd8219e1d0961ca0ae44810461e137e31b06616f5ef54662')

package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
