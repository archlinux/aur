pkgname=sauna-sim
pkgver=0.24.3
pkgrel=1
pkgdesc="ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://saunasim.com"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('dc436e8f1487f0f28ac6c3fcafccf38c36f719daeed46c3fb63d6f858f98bb83')
sha256sums_aarch64=('1c7c52def883105b17b27d378652a16116b109739d27865548777d2d558e20d7')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
