pkgname=pirate-radio-labs
pkgver=0.4.0
pkgrel=1
pkgdesc="A file explorer and mod creator for Knockout City's Private Server Edition"
arch=('x86_64')
url="https://github.com/KnockoutCity-Pirate-Radio/PirateRadio-Artifacts"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/labs-v${pkgver}/Pirate.Radio.Labs_${pkgver}_amd64.deb")
sha256sums_x86_64=('030abb0a97a7df58e157ad3af0ee6a81c367a17870db813c705ee310b5a3b2f1')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
