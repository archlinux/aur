pkgname=pirate-radio-launcher
pkgver=0.14.0
pkgrel=1
pkgdesc="A launcher for Knockout City's Private Server Edition"
arch=('x86_64')
url="https://github.com/KnockoutCity-Pirate-Radio/PirateRadio-Artifacts"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/launcher-v${pkgver}/Pirate.Radio.Launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('2d540485042d8ae06f01f5c8f8fc64b51117848718efdba2ef00a8069fb9ef5b')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
