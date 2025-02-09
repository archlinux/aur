pkgname=sauna-sim
pkgver=0.22.5
pkgrel=1
pkgdesc="SaunaSim. An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://github.com/sauna-sim/sauna-ui"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('FD38245F9E5F15C84C4713A6452C17C6026DB94F992E9B05AED2380E2EE17FE4')
sha256sums_aarch64=('87B9061B1B8E2631F52A9F4F55F403F1194311EDECA9DA3BEDAA7A83AEFF5938')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
