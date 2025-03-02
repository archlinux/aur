pkgname=sauna-sim
pkgver=0.24.2
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
sha256sums_x86_64=('11eb17c75f7385126a89587c1fe47930a0a07c8f30f3fa7c79b1d9b4b8582f2a')
sha256sums_aarch64=('bcede04059630bf0181c906fe6579da47ec4fe97fc78cfe6418f157ddd006906')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
