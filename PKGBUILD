pkgname=swarmfm-player
pkgver=1.0.0
pkgrel=1
pkgdesc="A tauri app that runs a iframe of the youtube stream known as swarmfm."
arch=('x86_64')
url="https://github.com/gwashark/swarmfm-player"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'gst-libav')
options=('!strip' '!emptydirs')
install=${pkgname}.install
#source_x86_64=("${url}/releases/download/app-v${pkgver}/swarmfm_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/Nagol12344/swarmfm-player/releases/download/temp-patch-2/swarmfm_1.0.0_amd64.deb")
sha256sums_x86_64=('f2c0edaf5dbfba72f33e8c8a9318138f58d6b586e1f6c4bce30adda4fb97cb43')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
