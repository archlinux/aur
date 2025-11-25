pkgname=pirate-radio-labs
pkgver=0.2.0
pkgrel=1
pkgdesc="A file explorer and mod creator for Knockout City's Private Server Edition"
arch=('x86_64')
url="https://github.com/KnockoutCity-Pirate-Radio/PirateRadio-Artifacts"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/labs-v${pkgver}/Pirate.Radio.Labs_${pkgver}_amd64.deb")
sha256sums_x86_64=('082e585b4c4cc7af569f9a356c9de64e5730db54d26e44abf69ded6c444b6051')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
