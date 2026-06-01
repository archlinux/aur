# Maintainer: meatyari <https://github.com/MeatyAri>
pkgname=slideflare
pkgver=0.1.0
pkgrel=1
pkgdesc="⚡ Blazing fast, interactive presentation tool for developers, educators, and creators"
arch=('x86_64' 'aarch64')
url="https://github.com/MeatyAri/slideflare"
license=('MIT')
depends=(
  'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
  'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1'
)
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://github.com/MeatyAri/slideflare/releases/download/v${pkgver}/slideflare_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/MeatyAri/slideflare/releases/download/v${pkgver}/slideflare_${pkgver}_arm64.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
