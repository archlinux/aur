# Maintainer: Alexandar <alex.goranov8@gmail.com>
pkgname=rosepad
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple cross-platform text editor made for writing notes, letters, poems, and such with ease with a beautiful UI."
arch=('x86_64' 'aarch64')
url="https://github.com/TMG8047KG/RosePad"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/TMG8047KG/RosePad/releases/download/v$pkgver/rosepad_"$pkgver"_amd64.deb")
sha256sums_x86_64=('78d1ea1680b5f5d87b1ebe17846e29fa17713836a28c3245a1d9393d9336f730')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}