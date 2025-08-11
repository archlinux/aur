# Maintainer: Alexandar <alex.goranov8@gmail.com>
pkgname=rosepad
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple cross-platform text editor made for writing notes, letters, poems, and such with ease with a beautiful UI."
arch=('x86_64' 'aarch64')
url="https://github.com/TMG8047KG/RosePad"
license=('GPL')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/TMG8047KG/RosePad/releases/download/v$pkgver/rosepad_"$pkgver"_amd64.deb")
sha256sums_x86_64=('88ceeac3875b1aa0d7f9e4aafb8c0f922731d4b2615cd610a48a4a53f32f929d')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
