pkgname=sauna-sim
pkgver=0.22.7
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
sha256sums_x86_64=('352C230EA6C2CC5F015B34C0E6AA9B27C15346B42200EB9A07B983ECE23405B5')
sha256sums_aarch64=('7B25FB9217E8290825D5D6D8D1A50A4E795674C852D300DD0E520882ED5A5303')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
