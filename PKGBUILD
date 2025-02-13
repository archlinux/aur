pkgname=sauna-sim
pkgver=0.22.13
pkgrel=1
pkgdesc="An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://sauna-sim.github.io"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('979E26141CFBC27137670D3524B02A655034AA3D2B4BE70F108E496EE5D9FB06')
sha256sums_aarch64=('0DC99F10482F6B937B27046BE5706C41363284AB31C6A9C838C4FAF6A779E2A8')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
