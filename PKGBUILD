pkgname=sauna-sim
pkgver=0.22.8
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
sha256sums_x86_64=('388FC4792ADA8F86EC03CE31B7B77D9F08F6AB5D18FD413E20D27CB0C2D0556F')
sha256sums_aarch64=('69CDE98D9DAAEA862030B84AE2FA57F8D6263FBDA68BE332EFC2A1C34FBE4B12')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
