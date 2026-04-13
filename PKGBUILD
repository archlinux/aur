pkgname=pirate-radio-launcher
pkgver=0.6.0
pkgrel=1
pkgdesc="A launcher for Knockout City's Private Server Edition"
arch=('x86_64')
url="https://github.com/KnockoutCity-Pirate-Radio/PirateRadio-Artifacts"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/launcher-v${pkgver}/Pirate.Radio.Launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('0cd51813bf684f7ea8388f223be05fd5cd345a0b1da388c03dddc0b88e001065')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
